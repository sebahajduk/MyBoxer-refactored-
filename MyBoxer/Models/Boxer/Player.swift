//
//  Player.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/10/2022.
//

import Foundation
import RealmSwift

enum Divisions: String {
    case lightweight, middleweight, heavyweight
}

class Player: Boxer {
    @Persisted var currentLevel: Int = 1
    @Persisted var experience: Double = 0.0
    @Persisted var nextLevel: Double = 100.0

    @Persisted var money: Int = 0

    // Multipliers for team members effects
    @Persisted var moneyMultiplier = 1.0
    @Persisted  var trainingEffect = 1.0
    @Persisted var fightRegeneration = 1.0
    @Persisted var homeRegeneration = 1.0

    var division: Divisions {
        get {
            if let division = Divisions(rawValue: divisionRawValue) {
                return division
            } else {
                return Divisions.lightweight
            }
        }
        set { divisionRawValue = newValue.rawValue }
    }

    @Persisted private var divisionRawValue = Divisions.lightweight.rawValue
    @Persisted var rank: Int = 0

    @Persisted var equipment = List<Int>()
    @Persisted var team = List<String>()
    @Persisted var defeatedOpponents = List<String>()

    override init() {
        super.init()

        name = "My Boxer"
    }

    func training(_ type: TrainingType) {
        switch type {
            
        case .shadowBoxing:
            movement += 1
            defence += 1
            
        case .weightLifting:
            punchPower += 2
            
        case .jumpingRope:
            footwork += 2
        
        case .ballThrow:
            punchSpeed += 2
        
        case .intervals:
            endurance += 2
        }
        stamina -= 5
        experienceGained(points: 50)
    }
    
    func homeRegeneration(intervals: Int = 0) {
        if stamina < fullStamina {
            stamina += fullStamina * ((0.01 * homeRegeneration) * Double(intervals))
        }
        
        if stamina > fullStamina {
            stamina = fullStamina
        }
        
        if hp < vitality {
            hp += vitality * ((0.01 * homeRegeneration) * Double(intervals))
        }
        
        if hp > vitality {
            hp = vitality
        }
    }
    
    func fightFinished(against opponent: Opponent, result: FightResults) {
        switch result {
        case .victory:
            money += Int(opponent.vitality * 1000)
            experienceGained(points: opponent.vitality)
            defeatedOpponents.append(opponent.name)
            
            if let oldWinsRecord = record["Wins"] {
                let newWinsRecord = oldWinsRecord + 1
                record.updateValue(newWinsRecord, forKey: "Wins")
            }
       case .defeat:
            if let oldLossesRecord = record["Losses"] {
                let newLossesRecord = oldLossesRecord + 1
                record.updateValue(newLossesRecord, forKey: "Losses")
            }
        }
    }
    
    func rankUp() {
        rank += 1
    }
    
    func promote() {
        if division == .lightweight {
            division = .middleweight
            rank = 0
        } else if division == .middleweight {
            division = .heavyweight
            rank = 0
        } else {
            //Won the game
        }
    }
    
    func hire(member: Member) {
        money -= member.price
        switch member.type {
        case .manager:
            moneyMultiplier = 1.0
            moneyMultiplier += Double(member.stats) / 100
        case .coach:
            trainingEffect = 1.0
            trainingEffect += Double(member.stats) / 100
        case .cutman:
            fightRegeneration = 1.0
            fightRegeneration += Double(member.stats) / 100
        case .physio:
            homeRegeneration = 1.0
            homeRegeneration += Double(member.stats) / 100
        }

        team.append(member.name)
    }
    
    func buyItem(_ item: Item) {
        money -= item.cost
        switch item.type {
        case .gloves:
            punchPower += item.stats
        case .boots:
            footwork += item.stats
        case .shorts:
            movement += item.stats
        case .tapes:
            punchSpeed += item.stats
        }
        equipment.append(item.id)
    }
    
    private func experienceGained(points: Double) {
        experience += points
        if experience >= nextLevel {
            levelUp()
        }
    }
    
    private func levelUp() {
        experience -= nextLevel
        nextLevel += 100 * Double(currentLevel)
        currentLevel += 1
        
        if currentLevel % 3 == 0 {
            vitality += 10
            movement += 1
            defence += 1
            punchSpeed += 1
            punchPower += 1
            footwork += 1
            endurance += 1
        }
        
        if experience >= nextLevel {
            levelUp()
        }
    }
}

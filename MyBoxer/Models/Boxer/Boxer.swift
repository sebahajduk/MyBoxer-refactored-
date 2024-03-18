//
//  Boxer.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit
import RealmSwift

enum punchTypes: CaseIterable {
    case jab, hook, uppercut
}

class Boxer: Object {
    @Persisted var vitality: Double = 100.0
    @Persisted var punchPower: Double = 10
    @Persisted var punchSpeed: Double = 10
    @Persisted var footwork: Double = 10
    @Persisted var movement: Double = 10
    @Persisted var defence: Double = 10
    @Persisted var endurance: Double = 10

    @Persisted var hp: Double = 100
    @Persisted var stamina: Double = 100
    @Persisted var fullStamina: Double = 100
    @Persisted var name: String!

    var record: [String: Int] = ["Wins": 0, "Draws": 0, "Losses": 0]
    
    func punch(opponent: Boxer) -> Double {
        guard
            let punchType = punchTypes.allCases.randomElement()
        else { return 0.0 }

        let attPower = punchPower - (opponent.defence * 0.1)
        let hitChance = (punchSpeed - ((opponent.movement + opponent.footwork) * 0.1)) / punchSpeed

        let randomDouble = Double.random(in: 0...1)
        var damageMultiplier = 1.0

        switch punchType {
        case .jab:
            // Fastest punch. It has biggest chance to hit the target, but damage is small.
            if stamina >= 1 { stamina -= 1 } else { return 0.00001 }
            
            if randomDouble <= hitChance {
                damageMultiplier = Double.random(in: 0.8...1.0)
            } else {
                return 0.0
            }

        case .hook:
            // Medium punch. It has smaller chance to hit the target, but damage is bigger than jab.
            if stamina >= 3 { stamina -= 3 } else { return 0.00001 }
            
            if randomDouble <= hitChance - 0.2 {
                damageMultiplier = Double.random(in: 0.9...1.2)
            } else {
                return 0.0
            }
            
        case .uppercut:
            // Hard punch. It has the biggest damage, but it's hard to hit the target.
            if stamina >= 5 { stamina -= 5 } else { return 0.00001 }
            
            if randomDouble <= hitChance - 0.4 {
                damageMultiplier = Double.random(in: 1.2...1.6)
            } else {
                return 0.0
            }
        }

        return attPower * damageMultiplier
    }
    
    func regeneration(multiplier: Double = 1.0) {
        stamina += endurance * multiplier
        if stamina > fullStamina {
            stamina = fullStamina
        }
    }
}

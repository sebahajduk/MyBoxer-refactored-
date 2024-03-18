//
//  Opponent.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/10/2022.
//

import Foundation

class Opponent: Boxer {
    
    convenience init(forLevel: Int, name: String, wins: Int, draws: Int, losses: Int) {
        self.init()
        
        vitality = Double(forLevel) * 150
        hp = vitality
        self.name = name
        punchPower = Double(forLevel * 2)
        punchSpeed = Double(forLevel * 2)
        footwork = Double(forLevel * 4)
        movement = Double(forLevel * 3)
        defence = Double(forLevel * 3)
        endurance = Double(forLevel * 5)
        record = ["Wins": wins, "Draws": draws, "Losses": losses]
    }
}

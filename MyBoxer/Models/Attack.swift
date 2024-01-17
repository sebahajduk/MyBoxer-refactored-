//
//  Attack.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 06/11/2022.
//

import Foundation

struct Attack {
    let attacker: Attacker
    let damage: Double
    
    static func hit(attacker: Boxer, defender: Boxer) -> Double {
        let damage = attacker.punch(opponent: defender)
        
        return damage
    }
}

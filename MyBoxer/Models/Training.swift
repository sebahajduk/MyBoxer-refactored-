//
//  Training.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/09/2022.
//

import Foundation
import UIKit

enum TrainingType {
    case shadowBoxing, weightLifting, jumpingRope, ballThrow, intervals
}

struct Training {
    let name: String
    let staminaNeeded: Int
    let effect: String
    let image: UIImage
    let type: TrainingType

    
    init(type: TrainingType) {
        self.type = type
        switch type {
        case .shadowBoxing:
            name = "Shadow boxing"
            staminaNeeded = 5
            effect = "+1 Movement / +1 Defence"
            image = Images.shadowBox
            
        case .weightLifting:
            name = "Weight lifting"
            staminaNeeded = 5
            effect = "+2 Punch power"
            image = Images.weightLift
            
        case .jumpingRope:
            name = "Jumping rope"
            staminaNeeded = 5
            effect = "+2 Footwork"
            image = Images.jumpingRope
            
        case .ballThrow:
            name = "Ball throw"
            staminaNeeded = 5
            effect = "+2 Punch speed"
            image = Images.ballThrow
            
        case .intervals:
            name = "Intervals"
            staminaNeeded = 5
            effect = "+2 Endurance"
            image = Images.interval
        }
    }
}

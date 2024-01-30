//
//  MyBoxerErrorProtocol.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

enum AlertType: Error {
    case youWin, youLose, youExhausted, notEnoughMoney, trainingInProgress
}

extension AlertType: LocalizedError {
    var title: String {
        switch self {
        case .youWin:
            "You won!"
        case .youLose:
            "You lost!"
        case .youExhausted:
            "You are exhausted!"
        case .notEnoughMoney:
            "You don't have enough money!"
        case .trainingInProgress:
            "You are already training!"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .youWin:
            "Congratulations!"
        case .youLose:
            "You lose, maybe try train more"
        case .youExhausted:
            "Give your boxer time to rest."
        case .notEnoughMoney:
            "Win some fight to get more cash."
        case .trainingInProgress:
            "You need to finish your training first."
        }
    }
}

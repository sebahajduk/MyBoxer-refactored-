//
//  OpponentsInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import Foundation

typealias OpponentsInteractorInput = PresenterToInteractorOpponentsModuleCommunicator
typealias OpponentsInteractorOutput = InteractorToPresenterOpponentsModuleCommunicator

final class OpponentsInteractor {
    weak var presenter: OpponentsInteractorOutput?
}

extension OpponentsInteractor: OpponentsInteractorInput {
    func setupOpponents(for player: Player) {
        var opponents = [Opponent]()

        switch player.division {
        case .lightweight:
            BoxersRepository.lightweightBoxers.forEach { opponent in
                if let opponent = opponent as? Opponent {
                    opponents.append(opponent)
                }
            }
        case .middleweight:
            BoxersRepository.middleweightBoxers.forEach { opponent in
                if let opponent = opponent as? Opponent {
                    opponents.append(opponent)
                }
            }
        case .heavyweight:
            BoxersRepository.heavyweightBoxers.forEach { opponent in
                if let opponent = opponent as? Opponent {
                    opponents.append(opponent)
                }
            }
        }

        presenter?.setOpponentsList(opponents)
    }
}

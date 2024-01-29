//
//  OpponentsInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import Foundation

typealias OpponentsInteractorInput = PresenterToInteractorOpponentsModuleProtocol
typealias OpponentsInteractorOutput = InteractorToPresenterOpponentsModuleProtocol

final class OpponentsInteractor {
    weak var presenter: OpponentsInteractorOutput?
}

extension OpponentsInteractor: OpponentsInteractorInput {
    func setupOpponents(for player: Player) {
        var opponents = [Opponent]()

        switch player.division {
        case .lightweight:
            Boxers.lightweightBoxers.forEach { opponent in
                if let opponent = opponent as? Opponent {
                    opponents.append(opponent)
                }
            }
        case .middleweight:
            Boxers.middleweightBoxers.forEach { opponent in
                if let opponent = opponent as? Opponent {
                    opponents.append(opponent)
                }
            }
        case .heavyweight:
            Boxers.heavyweightBoxers.forEach { opponent in
                if let opponent = opponent as? Opponent {
                    opponents.append(opponent)
                }
            }
        }

        presenter?.setOpponentsList(opponents)
    }
}

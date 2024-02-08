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

    private var player: Player
    private var database: RealmRepositorable

    init(database: RealmRepositorable) {
        self.database = database
        player = database.getPlayer()
    }
}

extension OpponentsInteractor: OpponentsInteractorInput {
    func getPlayer() -> Player {
        player
    }
    
    func setupOpponents() {
        var opponents = [Opponent]()
        var defeatedOpponents = [Opponent]()

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
        
        player.defeatedOpponents.forEach { defeatedOpponentName in
            if let index = opponents.firstIndex(where: { $0.name == defeatedOpponentName }) {
                defeatedOpponents.append(opponents[index])
            }
        }

        presenter?.setOpponentsList(opponents, defeatedList: defeatedOpponents)
    }
}

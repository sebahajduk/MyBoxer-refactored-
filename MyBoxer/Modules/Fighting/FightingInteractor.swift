//
//  FightingInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

final class FightingInteractor {
    weak var presenter: InteractorToPresenterFightingCommunicator?
    var fightHandler: FightHandler

    init(player: Player, opponent: Opponent) {
        fightHandler = FightHandler(player: player, opponent: opponent)
        fightHandler.interactor = self
    }
}

extension FightingInteractor: PresenterToInteractorFightingCommunicator {
    func startFight() {
        fightHandler.startFight()
    }
    
    func setupData() {
        let names = fightHandler.getBoxersNames()

        presenter?.setupNames(names)
    }
}

extension FightingInteractor: Fightable {
    func updateData(_ data: FightingViewUpdateDependencies) {
        presenter?.updateData(data)
    }

    func fightFinished(with result: FightResults) {
        presenter?.fightFinished(with: result)
    }
}

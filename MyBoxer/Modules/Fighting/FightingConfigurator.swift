//
//  FightingConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

final class FightingConfigurator {
    func setupViewController(
        player: Player,
        opponent: Opponent
    ) -> FightingViewController {
        let view = FightingViewController()
        let interactor = FightingInteractor(player: player, opponent: opponent)
        let presenter = FightingPresenter()
        let router = FightingRouter()

        view.presenter = presenter
        interactor.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}

//
//  TeamConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/02/2024.
//

import Foundation

final class TeamConfigurator {
    func setupViewController(player: Player) -> TeamViewController {
        let view = TeamViewController(player: player)
        let presenter = TeamPresenter()
        let interactor = TeamInteractor()
        let router = TeamRouter()

        view.presenter = presenter
        interactor.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}

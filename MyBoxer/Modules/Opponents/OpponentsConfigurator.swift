//
//  OpponentsConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import Foundation

final class OpponentsConfigurator {
    func setupViewController(with player: Player) -> OpponentsViewController {
        let viewController = OpponentsViewController(player: player)
        let presenter = OpponentsPresenter()
        let interactor = OpponentsInteractor()
        let router = OpponentsRouter()

        viewController.presenter = presenter
        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController

        return viewController
    }
}

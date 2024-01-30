//
//  TrainingConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class TrainingConfigurator {
    func setupViewController(with player: Player) -> TrainingViewController {
        let viewController = TrainingViewController(player: player)
        let presenter = TrainingPresenter()
        let interactor = TrainingInteractor()
        let router = TrainingRouter(navigationController: viewController.navigationController)

        viewController.presenter = presenter
        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController

        return viewController
    }
}

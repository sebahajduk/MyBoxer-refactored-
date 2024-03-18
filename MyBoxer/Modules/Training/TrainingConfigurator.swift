//
//  TrainingConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class TrainingConfigurator {
    static func setupViewController(
        with realm: RealmRepositorable,
        timeHandler: TimeHandler
    ) -> TrainingViewController {
        let viewController = TrainingViewController()
        let presenter = TrainingPresenter()
        let interactor = TrainingInteractor(database: realm, timeHandler: timeHandler)
        let router = TrainingRouter(navigationController: viewController.navigationController)

        viewController.presenter = presenter
        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController

        return viewController
    }
}

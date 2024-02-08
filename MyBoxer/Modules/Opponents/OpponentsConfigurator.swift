//
//  OpponentsConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import Foundation

final class OpponentsConfigurator {
    static func setupViewController(with realm: RealmRepositorable) -> OpponentsViewController {
        let viewController = OpponentsViewController()
        let presenter = OpponentsPresenter()
        let interactor = OpponentsInteractor(database: realm)
        let router = OpponentsRouter()

        viewController.presenter = presenter
        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController

        return viewController
    }
}

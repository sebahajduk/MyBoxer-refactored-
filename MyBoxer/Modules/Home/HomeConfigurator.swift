//
//  HomeConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/01/2024.
//

import Foundation

final class HomeConfigurator {
    static func setupHomeModule(with realm: RealmRepositorable) -> HomeViewController {
        let viewController = HomeViewController()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor(database: realm)

        viewController.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        
        interactor.presenter = presenter

        return viewController
    }
}

//
//  TeamConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/02/2024.
//

import Foundation

final class TeamConfigurator {
    static func setupViewController(with realm: RealmRepositorable) -> TeamViewController {
        let view = TeamViewController()
        let presenter = TeamPresenter()
        let interactor = TeamInteractor(database: realm)
        let router = TeamRouter()

        view.presenter = presenter
        interactor.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}

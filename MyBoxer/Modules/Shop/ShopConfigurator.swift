//
//  ShopConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class ShopConfigurator {
    static func setupViewController(with realm: RealmRepositorable) -> ShopViewController {
        let view = ShopViewController()
        let presenter = ShopPresenter()
        let interactor = ShopInteractor(database: realm)
        let router = ShopRouter()

        view.presenter = presenter
        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        return view
    }
}

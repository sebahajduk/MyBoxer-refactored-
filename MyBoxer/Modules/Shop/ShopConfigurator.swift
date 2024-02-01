//
//  ShopConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class ShopConfigurator {
    func setupViewController(with player: Player) -> ShopViewController {
        let view = ShopViewController(player: player)
        let presenter = ShopPresenter()
        let interactor = ShopInteractor()
        let router = ShopRouter()

        view.presenter = presenter
        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        return view
    }
}

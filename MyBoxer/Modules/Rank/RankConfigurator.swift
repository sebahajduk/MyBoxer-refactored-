//
//  RankConfigurator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import UIKit

final class RankConfigurator {
    func setupViewController() -> RankViewController {
        let view = RankViewController()
        let presenter = RankPresenter()
        let interactor = RankInteractor()
        let router = RankRouter()

        view.presenter = presenter
        interactor.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}

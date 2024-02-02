//
//  HomePresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/01/2024.
//

import UIKit

final class HomePresenter {
    weak var view: PresenterToViewHomeModuleProtocol?
    var interactor: PresenterToInteractorHomeModuleProtocol?
    var router: PresenterToRouterHomeModuleProtocol?
}

extension HomePresenter: ViewToPresenterHomeModuleProtocol {
    func rankButtonTapped(_ navigationController: UINavigationController) {
        router?.pushRank(navigationController)
    }

    func detailsButtonTapped(_ navigationController: UINavigationController) {
        router?.presentDetails(navigationController)
    }

    func trainingButtonTapped(
        _ navigationController: UINavigationController,
        player: Player
    ) {
        router?.pushTraining(navigationController, player: player)
    }

    func opponentsButtonTapped(_ navigationController: UINavigationController, player: Player) {
        router?.pushOpponent(navigationController, player: player)
    }

    func shopButtonTapped(_ navigationController: UINavigationController, player: Player) {
        router?.pushShop(navigationController, player: player)
    }

    func teamButtonTapped(
        _ navigationController: UINavigationController,
        player: Player
    ) {
        router?.pushTeam(navigationController, player: player)
    }
}

extension HomePresenter: InteractorToPresenterHomeModuleProtocol { }

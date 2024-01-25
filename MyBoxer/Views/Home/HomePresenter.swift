//
//  HomePresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/01/2024.
//

import UIKit

protocol HomePresentable {
    func rankButtonTapped(_ navigationController: UINavigationController)
    func detailsButtonTapped(_ navigationController: UINavigationController)
    func trainingButtonTapped(_ navigationController: UINavigationController)
    func opponentsButtonTapped(_ navigationController: UINavigationController)
    func shopButtonTapped(_ navigationController: UINavigationController)
    func teamButtonTapped(_ navigationController: UINavigationController)
}

final class HomePresenter {
    var view: HomeViewController?
    var interactor: HomeInteractor?
    var router: HomeRoutable?
}

extension HomePresenter: HomePresentable {
    func rankButtonTapped(_ navigationController: UINavigationController) {
        router?.pushRank(navigationController)
    }

    func detailsButtonTapped(_ navigationController: UINavigationController) {
        router?.presentDetails(navigationController)
    }

    func trainingButtonTapped(_ navigationController: UINavigationController) {
        router?.pushTraining(navigationController)
    }

    func opponentsButtonTapped(_ navigationController: UINavigationController) {
        router?.pushOpponent(navigationController)
    }

    func shopButtonTapped(_ navigationController: UINavigationController) {
        router?.pushShop(navigationController)
    }

    func teamButtonTapped(_ navigationController: UINavigationController) {
        router?.pushShop(navigationController)
    }
}

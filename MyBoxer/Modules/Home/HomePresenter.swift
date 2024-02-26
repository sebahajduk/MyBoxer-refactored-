//
//  HomePresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/01/2024.
//

import UIKit

final class HomePresenter {
    weak var view: PresenterToViewHomeModuleCommunicator?
    var interactor: PresenterToInteractorHomeModuleCommunicator?
    var router: PresenterToRouterHomeModuleCommunicator?
}

extension HomePresenter: ViewToPresenterHomeModuleCommunicator {
    func viewLoaded() {
        interactor?.setupData()
    }

    func viewWillAppear() {
        interactor?.startTimer()
    }

    func rankButtonTapped(_ navigationController: UINavigationController) {
        router?.pushRank(navigationController)
    }

    func detailsButtonTapped(_ navigationController: UINavigationController) {
        router?.presentDetails(navigationController)
    }

    func trainingButtonTapped(_ navigationController: UINavigationController) {
        guard
            let realm = interactor?.getDatabaseDependency(),
            let timeHandler = interactor?.getTimeHandler()
        else { return }

        router?.pushTraining(
            navigationController,
            database: realm,
            timeHandler: timeHandler
        )
    }

    func opponentsButtonTapped(_ navigationController: UINavigationController) {
        guard 
            let realm = interactor?.getDatabaseDependency()
        else { return }

        router?.pushOpponent(navigationController, database: realm)
    }

    func shopButtonTapped(_ navigationController: UINavigationController) {
        guard
            let realm = interactor?.getDatabaseDependency()
        else { return }

        router?.pushShop(navigationController, database: realm)
    }

    func teamButtonTapped(_ navigationController: UINavigationController) {
        guard
            let realm = interactor?.getDatabaseDependency()
        else { return }

        router?.pushTeam(navigationController, database: realm)
    }
}

extension HomePresenter: InteractorToPresenterHomeModuleCommunicator {
    func updateTimer(with value: String, barProgress: Float) {
        view?.updateTimeLabelAndProgressBar(with: value, progress: barProgress)
    }
    
    func playerLoaded(with values: HomeDependencies) {
        view?.updateCoinValueTo(values.money)

        view?.updateProgressBarsFill(values.barsPercentage)
        view?.updateProgressBarsValue(values.barsValues)
    }
}

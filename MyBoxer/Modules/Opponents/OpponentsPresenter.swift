//
//  OpponentsPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

final class OpponentsPresenter {
    weak var view: PresenterToViewOpponentsModuleProtocol?
    var interactor: PresenterToInteractorOpponentsModuleProtocol?
    var router: PresenterToRouterOpponentsModuleProtocol?
}

extension OpponentsPresenter: ViewToPresenterOpponentsModuleProtocol {
    func setupOpponents(for player: Player) {
        interactor?.setupOpponents(for: player)
    }

    func didSelect(
        opponent: Opponent,
        vs player: Player,
        _ navigationController: UINavigationController
    ) {
        if player.hp > 50 {
            router?.startFightBetween(player: player, opponent: opponent, navigationController)
        } else {
            let alert = AlertViewController(alertType: .youExhausted)

            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve

            navigationController.present(alert, animated: true)
        }
    }
}

extension OpponentsPresenter: InteractorToPresenterOpponentsModuleProtocol {
    func setOpponentsList(_ opponents: [Opponent]) {
        view?.setupOpponentsSucceeded(list: opponents)
    }
}

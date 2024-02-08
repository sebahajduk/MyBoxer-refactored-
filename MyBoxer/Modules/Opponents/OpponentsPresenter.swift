//
//  OpponentsPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

final class OpponentsPresenter {
    weak var view: PresenterToViewOpponentsModuleCommunicator?
    var interactor: PresenterToInteractorOpponentsModuleCommunicator?
    var router: PresenterToRouterOpponentsModuleCommunicator?
}

extension OpponentsPresenter: ViewToPresenterOpponentsModuleCommunicator {
    func viewLoaded() {
        interactor?.setupOpponents()
    }

    func didSelect(
        opponent: Opponent,
        _ navigationController: UINavigationController
    ) {
        guard let player = interactor?.getPlayer() else { return }
        
        if player.hp > 50 {
            router?.startFightBetween(player: player, opponent: opponent, navigationController)
        } else {
            view?.presentAlert(reason: .youExhausted)
        }
    }
}

extension OpponentsPresenter: InteractorToPresenterOpponentsModuleCommunicator {
    func setOpponentsList(_ opponents: [Opponent], defeatedList: [Opponent]) {
        view?.setupOpponentsSucceeded(list: opponents, defeatedList: defeatedList)
    }
}

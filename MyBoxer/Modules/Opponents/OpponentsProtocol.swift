//
//  OpponentsCommunicator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

protocol ViewToPresenterOpponentsModuleCommunicator {
    func viewLoaded()
    func didSelect(opponent: Opponent, _ navigationController: UINavigationController)
}

protocol InteractorToPresenterOpponentsModuleCommunicator: AnyObject {
    func setOpponentsList(_ opponents: [Opponent], defeatedList: [Opponent])
}

protocol PresenterToViewOpponentsModuleCommunicator: AnyObject {
    func setupOpponentsSucceeded(list: [Opponent], defeatedList: [Opponent])
    func presentAlert(reason: AlertType)
}

protocol PresenterToInteractorOpponentsModuleCommunicator {
    func setupOpponents()
    func getPlayer() -> Player
}

protocol PresenterToRouterOpponentsModuleCommunicator {
    func startFightBetween(player: Player, opponent: Opponent, _ navigationController: UINavigationController)
}

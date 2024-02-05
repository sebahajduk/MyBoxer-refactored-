//
//  OpponentsCommunicator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

protocol ViewToPresenterOpponentsModuleCommunicator {
    func setupOpponents(for player: Player)
    func didSelect(opponent: Opponent, vs player: Player, _ navigationController: UINavigationController)
}

protocol InteractorToPresenterOpponentsModuleCommunicator: AnyObject {
    func setOpponentsList(_ opponents: [Opponent])
}

protocol PresenterToViewOpponentsModuleCommunicator: AnyObject {
    func setupOpponentsSucceeded(list: [Opponent])
}

protocol PresenterToInteractorOpponentsModuleCommunicator {
    func setupOpponents(for player: Player)
}

protocol PresenterToRouterOpponentsModuleCommunicator {
    func startFightBetween(player: Player, opponent: Opponent, _ navigationController: UINavigationController)
}

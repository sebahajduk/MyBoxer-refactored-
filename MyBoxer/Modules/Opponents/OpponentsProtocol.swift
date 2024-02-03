//
//  OpponentsProtocol.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

protocol ViewToPresenterOpponentsModuleProtocol {
    func setupOpponents(for player: Player)
    func didSelect(opponent: Opponent, vs player: Player, _ navigationController: UINavigationController)
}

protocol InteractorToPresenterOpponentsModuleProtocol: AnyObject {
    func setOpponentsList(_ opponents: [Opponent])
}

protocol PresenterToViewOpponentsModuleProtocol: AnyObject {
    func setupOpponentsSucceeded(list: [Opponent])
}

protocol PresenterToInteractorOpponentsModuleProtocol {
    func setupOpponents(for player: Player)
}

protocol PresenterToRouterOpponentsModuleProtocol {
    func startFightBetween(player: Player, opponent: Opponent, _ navigationController: UINavigationController)
}

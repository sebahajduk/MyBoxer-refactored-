//
//  OpponentsRouter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

final class OpponentsRouter: PresenterToRouterOpponentsModuleCommunicator {
    func startFightBetween(
        player: Player,
        opponent: Opponent,
        _ navigationController: UINavigationController
    ) {
        let configurator = FightingConfigurator()
        let viewController = configurator.setupViewController(player: player, opponent: opponent)


        navigationController.pushViewController(viewController, animated: true)
    }
}

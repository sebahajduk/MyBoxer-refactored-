//
//  OpponentsRouter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

typealias PresenterOutput = PresenterToRouterOpponentsModuleProtocol

final class OpponentsRouter: PresenterOutput {
    func startFightBetween(
        player: Player,
        opponent: Opponent,
        _ navigationController: UINavigationController
    ) {
        let fightingViewController = FightingViewController()

        fightingViewController.set(player: player, opponent: opponent)

        navigationController.pushViewController(fightingViewController, animated: true)
    }
}
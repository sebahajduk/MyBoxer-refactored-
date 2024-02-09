//
//  HomeRouter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/01/2024.
//

import UIKit

final class HomeRouter: PresenterToRouterHomeModuleCommunicator {
    func presentDetails(_ navigationController: UINavigationController) {
        let detailVC = PlayerDetailsViewController()

        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.modalTransitionStyle = .crossDissolve

        navigationController.present(detailVC, animated: true)
    }

    func pushRank(_ navigationController: UINavigationController) {
        let configurator = RankConfigurator()
        let viewController = configurator.setupViewController()

        navigationController.pushViewController(viewController, animated: true)
    }

    func pushTraining(
        _ navigationController: UINavigationController,
        database realm: RealmRepositorable,
        timeHandler: TimeHandler
    ) {
        let viewController = TrainingConfigurator.setupViewController(with: realm, timeHandler: timeHandler)

        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushOpponent(
        _ navigationController: UINavigationController,
        database realm: RealmRepositorable
    ) {
        let viewController = OpponentsConfigurator.setupViewController(with: realm)

        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushShop(
        _ navigationController: UINavigationController,
        database realm: RealmRepositorable
    ) {
        let viewController = ShopConfigurator.setupViewController(with: realm)

        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushTeam(
        _ navigationController: UINavigationController,
        database realm: RealmRepositorable
    ) {
        let viewController = TeamConfigurator.setupViewController(with: realm)

        navigationController.pushViewController(viewController, animated: true)
    }
}

//
//  HomeRouter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/01/2024.
//

import UIKit

final class HomeRouter: PresenterToRouterHomeModuleProtocol {
    func presentDetails(_ navigationController: UINavigationController) {
        let detailVC = PlayerDetailsViewController()

        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.modalTransitionStyle = .crossDissolve

        navigationController.present(detailVC, animated: true)
    }

    func pushRank(_ navigationController: UINavigationController) {
        let rankVC = RankViewController()

        navigationController.pushViewController(rankVC, animated: true)
    }

    func pushTraining(_ navigationController: UINavigationController) {
        let trainingVC = TrainingViewController()

        navigationController.pushViewController(trainingVC, animated: true)
    }
    
    func pushOpponent(
        _ navigationController: UINavigationController,
        player: Player
    ) {
        let configurator = OpponentsConfigurator()
        let viewController = configurator.setupViewController(with:player)

        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushShop(_ navigationController: UINavigationController) {
        let shopVC = ShopViewController()

        navigationController.pushViewController(shopVC, animated: true)
    }
    
    func pushTeam(_ navigationController: UINavigationController) {
        let teamVC = TeamViewController()

        navigationController.pushViewController(teamVC, animated: true)
    }
}

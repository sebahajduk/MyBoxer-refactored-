//
//  HomeProtocol.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

protocol ViewToPresenterHomeModuleProtocol {
    func rankButtonTapped(_ navigationController: UINavigationController)
    func detailsButtonTapped(_ navigationController: UINavigationController)
    func trainingButtonTapped(
        _ navigationController: UINavigationController,
        player: Player
    )
    func opponentsButtonTapped(
        _ navigationController: UINavigationController,
        player: Player
    )
    func shopButtonTapped(
        _ navigationController: UINavigationController,
        player: Player
    )
    func teamButtonTapped(_ navigationController: UINavigationController)
}

protocol PresenterToViewHomeModuleProtocol: AnyObject {
    func updateCoinValueTo(_ value: Int)
    func updateProgressBarsFill(_ fillPercent: (health: Float, stamina: Float, experience: Float))
    func updateProgressBarsValue<T: Numeric>(_ value: (health: T, stamina: T, experience: T))
}

protocol PresenterToInteractorHomeModuleProtocol { }

protocol PresenterToRouterHomeModuleProtocol {
    func presentDetails(_ navigationController: UINavigationController)
    func pushRank(_ navigationController: UINavigationController)
    func pushTraining(
        _ navigationController: UINavigationController,
        player: Player
    )
    func pushOpponent(
        _ navigationController: UINavigationController,
        player: Player
    )
    func pushShop(
        _ navigationController: UINavigationController,
        player: Player
    )
    func pushTeam(_ navigationController: UINavigationController)
}

protocol InteractorToPresenterHomeModuleProtocol: AnyObject { 
    // TODO: Updating view after backend changes
}

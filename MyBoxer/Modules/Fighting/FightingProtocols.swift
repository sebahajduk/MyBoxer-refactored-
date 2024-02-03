//
//  FightingProtocols.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

protocol ViewToPresenterFightingProtocol {
    func viewLoaded()
    func viewAppeared()
}

protocol InteractorToPresenterFightingProtocol: AnyObject {
    func updateData(_ data: FightingViewUpdateDependencies)
    func fightFinished(with result: FightResults)
    func setupNames(_ names: (player: String, opponent: String))
}

protocol PresenterToViewFightingProtocol: AnyObject {
    func setupInitialData(
        names: (
            player: String,
            opponent: String
        )
    )
    func updateUI(
        for data: FightingViewUpdateDependencies
    )
    func showAlert(
        _ type: AlertType
    )
}

protocol PresenterToInteractorFightingProtocol {
    func setupData()
    func startFight()
}

protocol PresenterToRouterFightingProtocol {

}

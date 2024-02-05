//
//  FightingCommunicators.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

protocol ViewToPresenterFightingCommunicator {
    func viewLoaded()
    func viewAppeared()
}

protocol InteractorToPresenterFightingCommunicator: AnyObject {
    func updateData(_ data: FightingViewUpdateDependencies)
    func fightFinished(with result: FightResults)
    func setupNames(_ names: (player: String, opponent: String))
}

protocol PresenterToViewFightingCommunicator: AnyObject {
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

protocol PresenterToInteractorFightingCommunicator {
    func setupData()
    func startFight()
}

protocol PresenterToRouterFightingCommunicator {

}

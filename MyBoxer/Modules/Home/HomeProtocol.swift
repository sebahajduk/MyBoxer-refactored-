//
//  HomeCommunicator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/01/2024.
//

import UIKit

typealias BarsPercentage = (health: Float, stamina: Float, experience: Float)
typealias BarsValues<T: Numeric> = (health: T, stamina: T, experience: T)

protocol ViewToPresenterHomeModuleCommunicator {
    func viewLoaded()
    func viewWillAppear()

    func rankButtonTapped(_ navigationController: UINavigationController)
    func detailsButtonTapped(_ navigationController: UINavigationController)
    func trainingButtonTapped(_ navigationController: UINavigationController)
    func opponentsButtonTapped(_ navigationController: UINavigationController)
    func shopButtonTapped(_ navigationController: UINavigationController)
    func teamButtonTapped(_ navigationController: UINavigationController)
}

protocol PresenterToViewHomeModuleCommunicator: AnyObject {
    func updateCoinValueTo(_ value: Int)
    func updateProgressBarsFill(_ fillPercent: BarsPercentage)
    func updateProgressBarsValue<T: Numeric>(_ value: BarsValues<T>)
    func updateTimeLabelAndProgressBar(with value: String, progress: Float)
}

protocol PresenterToInteractorHomeModuleCommunicator { 
    func setupData()
    func startTimer()
    func getPlayerObject() -> Player
    func getTimeHandler() -> TimeHandler
    func getDatabaseDependency() -> RealmRepositorable
}

protocol PresenterToRouterHomeModuleCommunicator {
    func presentDetails(_ navigationController: UINavigationController)
    func pushRank(_ navigationController: UINavigationController)
    func pushTraining(
        _ navigationController: UINavigationController,
        database realm: RealmRepositorable,
        timeHandler: TimeHandler
    )
    func pushOpponent(
        _ navigationController: UINavigationController,
        player: Player
    )
    func pushShop(
        _ navigationController: UINavigationController,
        player: Player
    )
    func pushTeam(
        _ navigationController: UINavigationController,
        player: Player
    )
}

struct HomeDependencies {
    var barsPercentage: BarsPercentage
    var barsValues: BarsValues<Double>
    var money: Int
}

protocol InteractorToPresenterHomeModuleCommunicator: AnyObject { 
    func playerLoaded(with values: HomeDependencies)
    func updateTimer(with value: String, barProgress: Float)
}

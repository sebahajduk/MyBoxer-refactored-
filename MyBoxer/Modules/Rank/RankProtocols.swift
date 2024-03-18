//
//  RankCommunicators.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

protocol ViewToPresenterRankCommunicator {
    func viewLoaded()
}

protocol InteractorToPresenterRankCommunicator: AnyObject {
    func didSetupData(
        _ data: (
            lightweight: [Boxer],
            middleweight: [Boxer],
            heavyweight: [Boxer]
        )
    )
}

protocol PresenterToViewRankCommunicator: AnyObject {
    func updateViewForReceivedData(
        _ data: (
            lightweight: [Boxer],
            middleweight: [Boxer],
            heavyweight: [Boxer]
        )
    )
}

protocol PresenterToInteractorRankCommunicator {
    func setupData()
}

protocol PresenterToRouterRankCommunicator {

}

//
//  RankProtocols.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

protocol ViewToPresenterRankProtocol {
    func viewLoaded()
}

protocol InteractorToPresenterRankProtocol: AnyObject {
    func didSetupData(
        _ data: (
            lightweight: [Boxer],
            middleweight: [Boxer],
            heavyweight: [Boxer]
        )
    )
}

protocol PresenterToViewRankProtocol: AnyObject {
    func updateViewForReceivedData(
        _ data: (
            lightweight: [Boxer],
            middleweight: [Boxer],
            heavyweight: [Boxer]
        )
    )
}

protocol PresenterToInteractorRankProtocol {
    func setupData()
}

protocol PresenterToRouterRankProtocol {

}

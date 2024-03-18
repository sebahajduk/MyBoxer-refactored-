//
//  RankPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

final class RankPresenter {
    weak var view: PresenterToViewRankCommunicator?
    var interactor: PresenterToInteractorRankCommunicator?
    var router: PresenterToRouterRankCommunicator?
}

extension RankPresenter: ViewToPresenterRankCommunicator {
    func viewLoaded() {
        interactor?.setupData()
    }
}

extension RankPresenter: InteractorToPresenterRankCommunicator {
    func didSetupData(
        _ data: (
            lightweight: [Boxer],
            middleweight: [Boxer],
            heavyweight: [Boxer]
        )
    ) {
        view?.updateViewForReceivedData(data)
    }
}

//
//  RankPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

final class RankPresenter {
    weak var view: PresenterToViewRankProtocol?
    var interactor: PresenterToInteractorRankProtocol?
    var router: PresenterToRouterRankProtocol?
}

extension RankPresenter: ViewToPresenterRankProtocol {
    func viewLoaded() {
        interactor?.setupData()
    }
}

extension RankPresenter: InteractorToPresenterRankProtocol {
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

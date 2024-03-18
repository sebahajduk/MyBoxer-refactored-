//
//  RankInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

final class RankInteractor {
    weak var presenter: InteractorToPresenterRankCommunicator?
}

extension RankInteractor: PresenterToInteractorRankCommunicator {
    func setupData() {
        let lightweight = BoxersRepository.lightweightBoxers
        let middleweight = BoxersRepository.middleweightBoxers
        let heavyweight = BoxersRepository.heavyweightBoxers

        presenter?.didSetupData((lightweight: lightweight, middleweight: middleweight, heavyweight: heavyweight))
    }
}

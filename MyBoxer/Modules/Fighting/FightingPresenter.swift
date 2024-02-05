//
//  FightingPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

final class FightingPresenter {
    weak var view: PresenterToViewFightingCommunicator?
    var interactor: PresenterToInteractorFightingCommunicator?
    var router: PresenterToRouterFightingCommunicator?
}

extension FightingPresenter: ViewToPresenterFightingCommunicator {
    func viewAppeared() {
        interactor?.startFight()
    }
    
    func viewLoaded() {
        interactor?.setupData()
    }
}

extension FightingPresenter: InteractorToPresenterFightingCommunicator {
    func updateData(_ data: FightingViewUpdateDependencies) {
        view?.updateUI(for: data)
    }
    
    func fightFinished(with result: FightResults) {
        switch result {
        case .victory:
            view?.showAlert(.youWin)
        case .defeat:
            view?.showAlert(.youLose)
        }
    }
    
    func setupNames(_ names: (player: String, opponent: String)) {
        view?.setupInitialData(names: names)
    }
}

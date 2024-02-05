//
//  TrainingPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class TrainingPresenter {
    weak var view: PresenterToViewTrainingCommunicator?
    var interactor: PresenterToInteractorTrainingCommunicator?
    var router: PresenterToRouterTrainingCommunicator?
}

extension TrainingPresenter: ViewToPresenterTrainingCommunicator {
    func didSelectTraining(_ training: Training, player: Player) {
        interactor?.startTraining(training, for: player)
    }
    
    func setupData() {
        interactor?.setupTrainingsList()
    }
}

extension TrainingPresenter: InteractorToPresenterTrainingCommunicator {
    func trainingStarted() {
        view?.dismissViewController()
    }
    
    func trainingCannotStart(reason: AlertType) {
        view?.showAlert(type: reason)
    }
    
    func onSucceedTrainingsList(_ trainingList: [Training]) {
        view?.setupTableViewFor(trainings: trainingList)
    }
}

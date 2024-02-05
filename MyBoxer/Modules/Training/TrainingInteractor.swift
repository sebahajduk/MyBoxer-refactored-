//
//  TrainingInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class TrainingInteractor {
    weak var presenter: InteractorToPresenterTrainingCommunicator?
    var timeHandler: TimeHandler

    init(timeHandler: TimeHandler) {
        self.timeHandler = timeHandler
    }
}

extension TrainingInteractor: PresenterToInteractorTrainingCommunicator {
    func startTraining(_ training: Training, for boxer: Player) {
        if timeHandler.inProgres {
            presenter?.trainingCannotStart(reason: .trainingInProgress)
        } else {
            timeHandler.train(for: 10)
            boxer.training(training.type)

            presenter?.trainingStarted()
        }
    }
    
    func setupTrainingsList() {
        let trainingList = TrainingsRepository.trainings

        presenter?.onSucceedTrainingsList(trainingList)
    }
}

//
//  TrainingInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class TrainingInteractor {
    weak var presenter: InteractorToPresenterTrainingProtocol?
}

extension TrainingInteractor: PresenterToInteractorTrainingProtocol {
    func startTraining(_ training: Training, for boxer: Player) {
        if TimeManagerLocal.shared.inProgres {
            presenter?.trainingCannotStart(reason: .trainingInProgress)
        } else {
            TimeManagerLocal.shared.train(for: 10)
            boxer.training(training.type)

            presenter?.trainingStarted()
        }
    }
    
    func setupTrainingsList() {
        let trainingList = TrainingsRepository.trainings

        presenter?.onSucceedTrainingsList(trainingList)
    }
}

//
//  TrainingInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class TrainingInteractor {
    weak var presenter: InteractorToPresenterTrainingCommunicator?
    
    private var timeHandler: TimeHandler
    private var database: RealmRepositorable
    private var player: Player

    init(
        database: RealmRepositorable,
        timeHandler: TimeHandler
    ) {
        self.database = database
        self.timeHandler = timeHandler

        player = database.getPlayer()
    }
}

extension TrainingInteractor: PresenterToInteractorTrainingCommunicator {
    func startTraining(_ training: Training) {
        if timeHandler.inProgres {
            presenter?.trainingCannotStart(reason: .trainingInProgress)
        } else {
            timeHandler.train(for: 10)

            #warning("Check if works")
            database.savePlayer {
                player.training(training.type)
            }

            presenter?.trainingStarted()
        }
    }
    
    func setupTrainingsList() {
        let trainingList = TrainingsRepository.trainings

        presenter?.onSucceedTrainingsList(trainingList)
    }
}

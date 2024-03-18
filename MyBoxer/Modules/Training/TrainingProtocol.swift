//
//  TrainingCommunicator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import UIKit

protocol ViewToPresenterTrainingCommunicator {
    func setupData()
    func didSelectTraining(_ training: Training)
}

protocol InteractorToPresenterTrainingCommunicator: AnyObject {
    func onSucceedTrainingsList(_ trainingList: [Training])
    func trainingStarted()
    func trainingCannotStart(reason: AlertType)
}

protocol PresenterToViewTrainingCommunicator: AnyObject {
    func setupTableViewFor(trainings: [Training])
    func showAlert(type: AlertType)
    func dismissViewController()
}

protocol PresenterToInteractorTrainingCommunicator {
    func startTraining(_ training: Training)
    func setupTrainingsList()
}

protocol PresenterToRouterTrainingCommunicator {

}

//
//  TrainingProtocol.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import UIKit

protocol ViewToPresenterTrainingProtocol {
    func setupData()
    func didSelectTraining(_ training: Training, player: Player)
}

protocol InteractorToPresenterTrainingProtocol: AnyObject {
    func onSucceedTrainingsList(_ trainingList: [Training])
    func trainingStarted()
    func trainingCannotStart(reason: AlertType)
}

protocol PresenterToViewTrainingProtocol: AnyObject {
    func setupTableViewFor(trainings: [Training])
    func showAlert(type: AlertType)
    func dismissViewController()
}

protocol PresenterToInteractorTrainingProtocol {
    func startTraining(_ training: Training, for boxer: Player)
    func setupTrainingsList()
}

protocol PresenterToRouterTrainingProtocol {

}

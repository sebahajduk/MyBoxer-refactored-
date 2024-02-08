//
//  TrainingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 24/09/2022.
//

import UIKit

class TrainingViewController: UIViewController {
    
    var presenter: ViewToPresenterTrainingCommunicator?

    private let trainingView = TrainingView()
    private var trainings = [Training]()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.setupData()
        configureTableView()
    }

    private func configureTableView() {
        view = trainingView

        trainingView.tableView.dataSource = self
        trainingView.tableView.delegate = self
    }
}

extension TrainingViewController: PresenterToViewTrainingCommunicator {
    func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }

    func setupTableViewFor(trainings: [Training]) {
        self.trainings = trainings

        trainingView.tableView.reloadData()
    }

    func showAlert(type: AlertType) {
        let alert = AlertViewController(alertType: type)

        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve

        navigationController?.present(alert, animated: true)
    }
}

extension TrainingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return trainings.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: TrainingCell.reuseID) as? TrainingCell
        else { return UITableViewCell() }

        cell.set(for: trainings[indexPath.row])
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        presenter?.didSelectTraining(trainings[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

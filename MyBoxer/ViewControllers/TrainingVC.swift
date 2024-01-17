//
//  TrainingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 24/09/2022.
//

import UIKit

class TrainingVC: UIViewController {
    
    let tableView = UITableView()
    
    var boxer: Player!
    
    let trainings: [Training] = [
        Training(type: .shadowBoxing),
        Training(type: .weightLifting),
        Training(type: .jumpingRope),
        Training(type: .ballThrow),
        Training(type: .intervals)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(myBoxer: Player) {
        self.init()
        boxer = myBoxer
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TrainingCell.self, forCellReuseIdentifier: TrainingCell.reuseID)
        tableView.rowHeight = 100
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TrainingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainingCell.reuseID) as! TrainingCell
        
        cell.set(for: trainings[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if TimeManagerLocal.shared.inProgres {
            let alert = AlertVC(title: "You're training", message: AlertType.trainingInProgress)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
        } else {
            TimeManagerLocal.shared.train(for: 10)
            boxer.training(trainings[indexPath.row].type)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

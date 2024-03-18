//
//  FightingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 29/09/2022.
//

import UIKit

final class OpponentsViewController: UIViewController {
    var presenter: ViewToPresenterOpponentsModuleCommunicator?
    
    private var opponentsView = OpponentsView()
    private var defeatedOpponents = [Opponent]()
    private var opponents = [Opponent]()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewLoaded()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        opponentsView.tableView.reloadData()
    }
}

private extension OpponentsViewController {
    func setupView() {
        view = opponentsView
        opponentsView.tableView.delegate = self
        opponentsView.tableView.dataSource = self
    }

    func reloadTableData() {
        DispatchQueue.main.async { [weak self] in
            self?.opponentsView.tableView.reloadData()
        }
    }
}

extension OpponentsViewController: PresenterToViewOpponentsModuleCommunicator {
    func presentAlert(reason: AlertType) {
        let alert = AlertViewController(alertType: reason)

        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve

        navigationController?.present(alert, animated: true)
    }
    
    func setupOpponentsSucceeded(list: [Opponent], defeatedList: [Opponent]) {
        self.opponents = list
        self.defeatedOpponents = defeatedList
    }
}

extension OpponentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opponents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OpponentCell.reuseID) as? OpponentCell else { return UITableViewCell() }

        cell.set(for: opponents[indexPath.row], index: indexPath.row)
        let opponentName = opponents[indexPath.row].name

        if defeatedOpponents.contains(where: { $0.name == opponentName}) {
            cell.backgroundColor = .systemGreen.withAlphaComponent(0.2)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let opponentName = opponents[indexPath.row].name

        if defeatedOpponents.contains(where: { $0.name == opponentName }) {
            return
        }

        guard let navigationController else { return }
        presenter?.didSelect(
            opponent: opponents[indexPath.row],
            navigationController
        )
    }
}

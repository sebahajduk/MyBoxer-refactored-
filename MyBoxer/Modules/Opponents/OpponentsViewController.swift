//
//  FightingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 29/09/2022.
//

import UIKit

final class OpponentsViewController: UIViewController {
    var presenter: ViewToPresenterOpponentsModuleProtocol?
    
    private var opponentsView = OpponentsView()
    private var player: Player!
    private var opponents: [Opponent] = []

    convenience init(player: Player) {
        self.init()
        
        self.player = player
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.setupOpponents(for: player)
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
}

extension OpponentsViewController: PresenterToViewOpponentsModuleProtocol {
    func setupOpponentsSucceeded(list: [Opponent]) {
        self.opponents = list
        opponentsView.tableView.reloadData()
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

        if player.defeatedOpponents.contains(where: { $0 == opponentName}) {
            cell.backgroundColor = .systemGreen.withAlphaComponent(0.2)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let opponentName = opponents[indexPath.row].name

        if player.defeatedOpponents.contains(where: {$0 == opponentName}) {
            return
        }

        guard let navigationController else { return }
        presenter?.didSelect(
            opponent: opponents[indexPath.row],
            vs: player,
            navigationController
        )
    }
}

//
//  FightingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 29/09/2022.
//

import UIKit

final class OpponentsViewController: UIViewController {
    
    private var opponentsView = OpponentsView()
    var player: Player!

    var opponents: [Opponent] = []

    convenience init(player: Player) {
        self.init()
        self.player = player
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            opponentsView.tableView.reloadData()
        }
    }
}

private extension OpponentsViewController {
    func configureOpponents() {
        switch player.division {
        case .lightweight:
            for boxer in Boxers.lightweightBoxers {
                if let opponent = boxer as? Opponent {
                    opponents.append(opponent)
                }
            }
        case .middleweight:
            for boxer in Boxers.middleweightBoxers {
                if let opponent = boxer as? Opponent {
                    opponents.append(opponent)
                }
            }
        case .heavyweight:
            for boxer in Boxers.heavyweightBoxers {
                if let opponent = boxer as? Opponent {
                    opponents.append(opponent)
                }
            }
        }
    }

    func setupView() {
        view = opponentsView
        opponentsView.tableView.delegate = self
        opponentsView.tableView.dataSource = self
    }

    func setupData() {
        configureOpponents()
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

        let fightingVC = FightingViewController()

        let opponentName = opponents[indexPath.row].name

        if player.defeatedOpponents.contains(where: {$0 == opponentName}) {
            return
        }

        if player.hp > 50 {
            fightingVC.set(player: player, opponent: opponents[indexPath.row])
            navigationController?.pushViewController(fightingVC, animated: true)
        } else {
            let alert = AlertViewController(title: "You're exhausted", message: AlertType.youExhausted)

            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve

            navigationController?.present(alert, animated: true)
        }
    }
}

//
//  FightingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 29/09/2022.
//

import UIKit

class OpponentsVC: UIViewController {
    
    let tableView = UITableView()
    
    var player: Player!
    
    var opponents: [Opponent] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    convenience init(player: Player) {
        self.init()
        self.player = player
    }
    
    private func configureOpponents() {
        switch player.division {
        case .lightweight:
            for boxer in Boxers.lightweightBoxers {
                if boxer is Opponent {
                    opponents.append(boxer as! Opponent)
                }
            }
        case .middleweight:
            for boxer in Boxers.middleweightBoxers {
                if boxer is Opponent {
                    opponents.append(boxer as! Opponent)
                }
            }
        case .heavyweight:
            for boxer in Boxers.heavyweightBoxers {
                if boxer is Opponent {
                    opponents.append(boxer as! Opponent)
                }
            }
        }
    }
    
    private func configure() {
        configureTableView()
        configureOpponents()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(OpponentCell.self, forCellReuseIdentifier: OpponentCell.reuseID)
        tableView.rowHeight = 202
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension OpponentsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opponents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OpponentCell.reuseID) as! OpponentCell
        
        cell.set(for: opponents[indexPath.row], index: indexPath.row)
        let opponentName = opponents[indexPath.row].name
        
        if player.defeatedOpponents.contains(where: { $0 == opponentName}) {
            cell.backgroundColor = .systemGreen.withAlphaComponent(0.2)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let fightingVC = FightingVC()
        
        let opponentName = opponents[indexPath.row].name
        
        if player.defeatedOpponents.contains(where: {$0 == opponentName}) {
            return
        }
        
        if player.hp > 50 {
            fightingVC.set(player: player, opponent: opponents[indexPath.row])
            navigationController?.pushViewController(fightingVC, animated: true)
        } else {
            let alert = AlertVC(title: "You're exhausted", message: AlertType.youExhausted)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
        }
    }
}

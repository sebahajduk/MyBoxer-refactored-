//
//  FightingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 04/11/2022.
//

import UIKit

enum FightResults {
    case victory, defeat
}

final class FightingViewController: UIViewController {

    private var fightingView = FightingView()

    private var player: Player!
    private var opponent: Opponent!

    private var attackHistory: [Attack] = []
    private var moves = 20
    private var round = 1
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.startTimer()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func set(player: Player, opponent: Opponent) {
        self.player = player
        self.opponent = opponent
    }
}

// MARK: - View setup
private extension FightingViewController {
    func setupView() {
        view = fightingView

        fightingView.setupNames(player: player.name, opponent: opponent.name)

        fightingView.updateRoundNumber(to: round)
        fightingView.updateMovesLeft(to: moves)

        fightingView.attackHistoryTableView.delegate = self
        fightingView.attackHistoryTableView.dataSource = self
    }
}

private extension FightingViewController {
    func startTimer() {
        var timerCounter = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            if timerCounter % 2 == 0 {
                var attack = Attack.hit(attacker: player, defender: opponent)
                if attack > opponent.hp {
                    attack = opponent.hp
                }
                opponent.hp -= attack
                attackHistory.insert(Attack(attacker: .player, damage: attack), at: 0)
            } else {
                var attack = Attack.hit(attacker: opponent, defender: player)
                if attack > player.hp {
                    attack = player.hp
                }
                player.hp -= attack
                attackHistory.insert(Attack(attacker: .opponent, damage: attack), at: 0)
            }
            timerCounter += 1
            self.checkStatus()
            self.updateUI()
        }
    }
    
    func updateUI() {
        if moves > 0 {
            self.moves -= 1
        } else if round < 10 {
            finishRound()
        } else {
            finishFight()
        }

        fightingView.updateRoundNumber(to: round)
        fightingView.updateMovesLeft(to: moves)

        fightingView.updatePlayerBars(
            hpBar: Float(player.hp / player.vitality),
            staminaBar: Float(player.stamina / player.fullStamina)
        )

        fightingView.updateOpponentBars(
            hpBar: Float(opponent.hp / opponent.vitality),
            staminaBar: Float(opponent.stamina / opponent.fullStamina)
        )

        fightingView.updateAttackHistory()
    }

    private func finishRound() {
        self.round += 1
        self.moves = 20
        opponent.regeneration()
        player.regeneration(multiplier: player.fightRegeneration)
    }
    
    private func finishFight() {
        timer?.invalidate()
        Defaults.shared.myBoxer = player
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func checkStatus() {
        if player.hp <= 0 {
            finishFight()
            showResult(.defeat)
            player.fightFinished(against: opponent, result: .defeat)
        } else if opponent.hp <= 0 {
            finishFight()
            showResult(.victory)
            player.fightFinished(against: opponent, result: .victory)
            RankManager.rankUp(winner: player)
        }
    }
    
    private func showResult(_ result: FightResults) {
        switch result {
        case .victory:
            let alert = AlertViewController(title: "Congratulations", message: AlertType.youWin)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
        case .defeat:
            let alert = AlertViewController(title: "Oopst", message: AlertType.youLose)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
        }
    }
}

extension FightingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attackHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FightingHitCell.reuseID) as! FightingHitCell
        
        cell.set(for: attackHistory[indexPath.row])
        
        return cell
    }
}

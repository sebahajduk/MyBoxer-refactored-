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

class FightingVC: UIViewController {
    
    var player: Player!
    var opponent: Opponent!
    
    var playerImage = MBImageView(frame: .zero)
    var opponentImage = MBImageView(frame: .zero)
    
    let roundLabel = MBLabel(size: 15)
    let roundNumberLabel = MBLabel(size: 20)

    let vsLabel = MBLabel(size: 15)

    let movesLeftLabel = MBLabel(size: 30)
    
    var playerName = MBLabel(size: 15)
    var opponentName = MBLabel(size: 15)
    
    var playerHealthBar = MBProgressView(for: .hp, showTitle: false)
    var playerStaminaBar = MBProgressView(for: .stamina, showTitle: false)
    
    var opponentHealthBar = MBProgressView(for: .hp, showTitle: false)
    var opponentStaminaBar = MBProgressView(for: .stamina, showTitle: false)
    
    let tableView = UITableView()
    var attackHistory: [Attack] = []
    var moves = 20
    var round = 1
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configure()
        configureConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
            startTimer()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func set(player: Player!, opponent: Opponent!) {
        self.player = player
        self.opponent = opponent
        
        opponentName.text = opponent.name
        playerName.text = player.name
    }
    
    private func startTimer() {
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
    
    private func updateUI() {
        if moves > 0 {
            self.moves -= 1
        } else if round < 10 {
            finishRound()
        } else {
            finishFight()
        }
        
        roundNumberLabel.text = "\(round)"
        movesLeftLabel.text = "\(moves)"
        
        playerHealthBar.setProgress(Float(player.hp/player.vitality), animated: true)
        playerStaminaBar.setProgress(Float(player.stamina/player.fullStamina), animated: true)
        
        opponentHealthBar.setProgress(Float(opponent.hp/opponent.vitality), animated: true)
        opponentStaminaBar.setProgress(Float(opponent.stamina/opponent.fullStamina), animated: true)
        
        UIView.transition(with: tableView, duration: 0.2, options: .transitionCrossDissolve, animations: { () -> Void in
            self.tableView.reloadData()
        })
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
            let alert = AlertVC(title: "Congratulations", message: AlertType.youWin)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
        case .defeat:
            let alert = AlertVC(title: "Oopst", message: AlertType.youLose)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
        }
    }
    
    private func configure() {
        view.addSubviews([playerImage, opponentImage, vsLabel, playerName, opponentName, playerHealthBar, playerStaminaBar, opponentHealthBar, opponentStaminaBar, tableView, roundLabel, roundNumberLabel, movesLeftLabel])
        
        playerImage.image = Images.player
        opponentImage.image = Images.opponent
        
        vsLabel.text = "VS"
        
        playerName.textAlignment = .center
        
        opponentName.textAlignment = .center
        
        roundLabel.text = "Round"
        roundLabel.textAlignment = .center
        
        roundNumberLabel.text = "\(round)"
        roundNumberLabel.textAlignment = .center
        
        movesLeftLabel.text = "\(moves)"
        movesLeftLabel.textAlignment = .center
        
        playerHealthBar.setProgress(1, animated: true)
        playerStaminaBar.setProgress(1, animated: true)
        
        opponentHealthBar.setProgress(1, animated: true)
        opponentStaminaBar.setProgress(1, animated: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FightingHitCell.self, forCellReuseIdentifier: FightingHitCell.reuseID)
        
        tableView.rowHeight = 20
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            playerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            playerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playerImage.heightAnchor.constraint(equalToConstant: 120),
            playerImage.widthAnchor.constraint(equalToConstant: 120),
            
            opponentImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            opponentImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            opponentImage.heightAnchor.constraint(equalToConstant: 120),
            opponentImage.widthAnchor.constraint(equalToConstant: 120),
            
            roundLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundLabel.widthAnchor.constraint(equalToConstant: 50),
            roundLabel.heightAnchor.constraint(equalToConstant: 16),
            
            roundNumberLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 5),
            roundNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundNumberLabel.widthAnchor.constraint(equalToConstant: 20),
            roundNumberLabel.heightAnchor.constraint(equalToConstant: 21),
            
            vsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vsLabel.bottomAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: -10),
            vsLabel.heightAnchor.constraint(equalToConstant: 20),
            vsLabel.widthAnchor.constraint(equalToConstant: 20),
            
            movesLeftLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movesLeftLabel.centerYAnchor.constraint(equalTo: playerHealthBar.bottomAnchor),
            movesLeftLabel.heightAnchor.constraint(equalToConstant: 31),
            movesLeftLabel.widthAnchor.constraint(equalToConstant: 30),
            
            playerName.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 10),
            playerName.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerName.heightAnchor.constraint(equalToConstant: 16),
            playerName.widthAnchor.constraint(equalToConstant: 120),
            
            opponentName.topAnchor.constraint(equalTo: opponentImage.bottomAnchor, constant: 10),
            opponentName.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentName.heightAnchor.constraint(equalToConstant: 16),
            opponentName.widthAnchor.constraint(equalToConstant: 120),
            
            playerHealthBar.topAnchor.constraint(equalTo: playerName.bottomAnchor, constant: 5),
            playerHealthBar.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerHealthBar.heightAnchor.constraint(equalToConstant: 10),
            playerHealthBar.widthAnchor.constraint(equalToConstant: 120),
            
            playerStaminaBar.topAnchor.constraint(equalTo: playerHealthBar.bottomAnchor, constant: 5),
            playerStaminaBar.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerStaminaBar.heightAnchor.constraint(equalToConstant: 10),
            playerStaminaBar.widthAnchor.constraint(equalToConstant: 120),
            
            opponentHealthBar.topAnchor.constraint(equalTo: opponentName.bottomAnchor, constant: 5),
            opponentHealthBar.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentHealthBar.heightAnchor.constraint(equalToConstant: 10),
            opponentHealthBar.widthAnchor.constraint(equalToConstant: 120),
            
            opponentStaminaBar.topAnchor.constraint(equalTo: opponentHealthBar.bottomAnchor, constant: 5),
            opponentStaminaBar.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentStaminaBar.heightAnchor.constraint(equalToConstant: 10),
            opponentStaminaBar.widthAnchor.constraint(equalToConstant: 120),
            
            tableView.topAnchor.constraint(equalTo: playerStaminaBar.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FightingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attackHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FightingHitCell.reuseID) as! FightingHitCell
        
        cell.set(for: attackHistory[indexPath.row])
        
        return cell
    }
}

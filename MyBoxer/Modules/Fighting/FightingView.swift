//
//  FightingView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 22/01/2024.
//

import UIKit
import DesignSystem

final class FightingView: UIView {

    private let playerImage = MBImageView(frame: .zero)
    private let playerName = MBLabel(size: 15)
    private let playerHealthBar = MBProgressView(for: .hp, showTitle: false)
    private let playerStaminaBar = MBProgressView(for: .stamina, showTitle: false)

    private let opponentImage = MBImageView(frame: .zero)
    private let opponentName = MBLabel(size: 15)
    private let opponentHealthBar = MBProgressView(for: .hp, showTitle: false)
    private let opponentStaminaBar = MBProgressView(for: .stamina, showTitle: false)

    private let roundLabel = MBLabel(size: 15)
    private let roundNumberLabel = MBLabel(size: 20)
    private let vsLabel = MBLabel(size: 15)
    private let movesLeftLabel = MBLabel(size: 30)

    private(set) var attackHistoryTableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        backgroundColor = .systemBackground
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupNames(player: String, opponent: String) {
        playerName.text = player
        opponentName.text = opponent
    }
}

//MARK: - UI Updating
extension FightingView {
    func updateMovesLeft(to value: Int) {
        movesLeftLabel.text = "\(value)"
    }

    func updateRoundNumber(to value: Int) {
        roundNumberLabel.text = "\(value)"
    }

    func updatePlayerBars(hpBar: Float, staminaBar: Float) {
        playerHealthBar.setProgress(hpBar, animated: true)
        playerStaminaBar.setProgress(staminaBar, animated: true)
    }

    func updateOpponentBars(hpBar: Float, staminaBar: Float) {
        opponentHealthBar.setProgress(hpBar, animated: true)
        opponentStaminaBar.setProgress(staminaBar, animated: true)
    }

    func updateAttackHistory() {
        UIView.transition(
            with: attackHistoryTableView,
            duration: 0.2,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                guard let self else { return }
                self.attackHistoryTableView.reloadData()
            }
        )
    }
}

// MARK: - UI setup
private extension FightingView {
    func setupView() {
        setupPlayerImage()
        setupPlayerName()
        setupPlayerBars()
        setupOpponentImage()
        setupOpponentName()
        setupOpponentBars()
        setupRoundLabels()
        setupTableView()

        setupConstraints()
    }

    func setupPlayerImage() {
        addSubviews([playerImage])

        playerImage.image = Images.player
    }

    func setupPlayerName() {
        addSubviews([playerName])
        playerName.textAlignment = .center
    }

    func setupPlayerBars() {
        addSubviews([playerHealthBar, playerStaminaBar])

        playerHealthBar.setProgress(1, animated: true)
        playerStaminaBar.setProgress(1, animated: true)
    }

    func setupOpponentImage() {
        addSubviews([opponentImage])
        opponentImage.image = Images.opponent
    }

    func setupOpponentName() {
        addSubviews([opponentName])
        opponentName.textAlignment = .center
    }

    func setupOpponentBars() {
        addSubviews([opponentHealthBar, opponentStaminaBar])

        opponentHealthBar.setProgress(1, animated: true)
        opponentStaminaBar.setProgress(1, animated: true)
    }

    func setupRoundLabels() {
        addSubviews([vsLabel, roundLabel, roundNumberLabel, movesLeftLabel])

        vsLabel.text = "VS"
        roundLabel.text = "Round"
        roundLabel.textAlignment = .center

        roundNumberLabel.textAlignment = .center
        movesLeftLabel.textAlignment = .center
    }

    func setupTableView() {
        addSubviews([attackHistoryTableView])

        attackHistoryTableView.register(FightingHitCell.self, forCellReuseIdentifier: FightingHitCell.reuseID)
        attackHistoryTableView.rowHeight = 20
    }
}

// MARK: - Constraints
private extension FightingView {
    func setupConstraints() {
        setupPlayerImageConstraints()
        setupPlayerNameConstraints()
        setupPlayerBarsConstraints()
        setupOpponentImageConstraints()
        setupOpponentNameConstraints()
        setupOpponentBarsConstraints()
        setupRoundLabelsConstraints()
        setupTableViewConstraints()
    }

    func setupPlayerImageConstraints() {
        NSLayoutConstraint.activate([
            playerImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            playerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            playerImage.heightAnchor.constraint(equalToConstant: 120),
            playerImage.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setupPlayerNameConstraints() {
        NSLayoutConstraint.activate([
            playerName.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 10),
            playerName.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerName.heightAnchor.constraint(equalToConstant: 16),
            playerName.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setupPlayerBarsConstraints() {
        NSLayoutConstraint.activate([
            playerHealthBar.topAnchor.constraint(equalTo: playerName.bottomAnchor, constant: 5),
            playerHealthBar.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerHealthBar.heightAnchor.constraint(equalToConstant: 10),
            playerHealthBar.widthAnchor.constraint(equalToConstant: 120),

            playerStaminaBar.topAnchor.constraint(equalTo: playerHealthBar.bottomAnchor, constant: 5),
            playerStaminaBar.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerStaminaBar.heightAnchor.constraint(equalToConstant: 10),
            playerStaminaBar.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setupOpponentImageConstraints() {
        NSLayoutConstraint.activate([
            opponentImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            opponentImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            opponentImage.heightAnchor.constraint(equalToConstant: 120),
            opponentImage.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setupOpponentNameConstraints() {
        NSLayoutConstraint.activate([
            opponentName.topAnchor.constraint(equalTo: opponentImage.bottomAnchor, constant: 10),
            opponentName.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentName.heightAnchor.constraint(equalToConstant: 16),
            opponentName.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setupOpponentBarsConstraints() {
        NSLayoutConstraint.activate([
            opponentHealthBar.topAnchor.constraint(equalTo: opponentName.bottomAnchor, constant: 5),
            opponentHealthBar.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentHealthBar.heightAnchor.constraint(equalToConstant: 10),
            opponentHealthBar.widthAnchor.constraint(equalToConstant: 120),

            opponentStaminaBar.topAnchor.constraint(equalTo: opponentHealthBar.bottomAnchor, constant: 5),
            opponentStaminaBar.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentStaminaBar.heightAnchor.constraint(equalToConstant: 10),
            opponentStaminaBar.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setupRoundLabelsConstraints() {
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            roundLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            roundLabel.widthAnchor.constraint(equalToConstant: 50),
            roundLabel.heightAnchor.constraint(equalToConstant: 16),

            roundNumberLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 5),
            roundNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            roundNumberLabel.widthAnchor.constraint(equalToConstant: 20),
            roundNumberLabel.heightAnchor.constraint(equalToConstant: 21),

            vsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            vsLabel.bottomAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: -10),
            vsLabel.heightAnchor.constraint(equalToConstant: 20),
            vsLabel.widthAnchor.constraint(equalToConstant: 20),

            movesLeftLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            movesLeftLabel.centerYAnchor.constraint(equalTo: playerHealthBar.bottomAnchor),
            movesLeftLabel.heightAnchor.constraint(equalToConstant: 31),
            movesLeftLabel.widthAnchor.constraint(equalToConstant: 30)])
    }

    func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            attackHistoryTableView.topAnchor.constraint(equalTo: playerStaminaBar.bottomAnchor, constant: 20),
            attackHistoryTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            attackHistoryTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            attackHistoryTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

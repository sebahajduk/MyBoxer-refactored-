//
//  HomeView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 17/01/2024.
//

import UIKit

final class HomeView: UIView {

    let healthProgress = MBProgressView(for: .hp)
    let staminaProgress = MBProgressView(for: .stamina)
    let experienceProgress = MBProgressView(for: .experience)

    let coinLabel = MBLabel(size: 15, color: .label, alignment: .right)
    let coinImage = UIImageView(image: Images.coin)
    let playerPhoto = UIImageView(image: Images.player)

    let timeProgress = MBProgressView(for: .time)
    let timeLeftLabel = MBLabel(size: 15, alignment: .center)

    let rankButton = MBHomeButton(image: Images.rank)
    let trainingButton = MBHomeButton(image: Images.bag)
    let fightButton = MBHomeButton(image: Images.ring)
    let shopButton = MBHomeButton(image: Images.shop)
    let teamButton = MBHomeButton(image: Images.team)

    override init(frame: CGRect) {
        super.init(frame: .zero)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Updating UI
extension HomeView {
    func updateCoinValueTo(_ value: Int) {
        coinLabel.text = String(value)
    }

    func updateProgressBarsFill(_ fillPercent: (health: Float, stamina: Float, experience: Float)) {
        healthProgress.setProgress(fillPercent.health, animated: true)
        staminaProgress.setProgress(fillPercent.stamina, animated: true)
        experienceProgress.setProgress(fillPercent.experience, animated: true)
    }

    func updateProgressBarsValue<T: Numeric>(_ value: (health: T, stamina: T, experience: T)) {
        healthProgress.setValue(value.health)
        staminaProgress.setValue(value.stamina)
        experienceProgress.setValue(value.experience)
    }
}

// MARK: - Views configuration
private extension HomeView {

    func configure() {
        backgroundColor = .systemBackground
        addSubviews([coinImage, coinLabel])
        
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        coinImage.tintColor = .systemYellow

        configureBars()
        configurePlayerPhoto()
        configureButtonsMenu()
        configureContraints()
    }

    func configureBars() {
        addSubviews([healthProgress, staminaProgress, experienceProgress, timeProgress, timeLeftLabel])
    }

    func configurePlayerPhoto() {
        addSubview(playerPhoto)
        playerPhoto.sizeToFit()
        playerPhoto.translatesAutoresizingMaskIntoConstraints = false
    }

    func configureButtonsMenu() {
        addSubviews([trainingButton, fightButton, shopButton, teamButton, rankButton])
    }

    func configureContraints() {
        NSLayoutConstraint.activate([
            coinImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            coinImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            coinImage.widthAnchor.constraint(equalToConstant: 15),
            coinImage.heightAnchor.constraint(equalToConstant: 15),

            coinLabel.centerYAnchor.constraint(equalTo: coinImage.centerYAnchor),
            coinLabel.trailingAnchor.constraint(equalTo: coinImage.leadingAnchor, constant: -2),
            coinLabel.widthAnchor.constraint(equalToConstant: 150),
            coinLabel.heightAnchor.constraint(equalToConstant: 15),

            healthProgress.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            healthProgress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            healthProgress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            healthProgress.heightAnchor.constraint(equalToConstant: 17),

            staminaProgress.topAnchor.constraint(equalTo: healthProgress.bottomAnchor, constant: 10),
            staminaProgress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            staminaProgress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            staminaProgress.heightAnchor.constraint(equalToConstant: 17),

            experienceProgress.topAnchor.constraint(equalTo: staminaProgress.bottomAnchor, constant: 10),
            experienceProgress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            experienceProgress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            experienceProgress.heightAnchor.constraint(equalToConstant: 17),

            playerPhoto.topAnchor.constraint(equalTo: experienceProgress.bottomAnchor, constant: 40),
            playerPhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
            playerPhoto.heightAnchor.constraint(equalToConstant: 240),
            playerPhoto.widthAnchor.constraint(equalToConstant: 240),

            timeProgress.topAnchor.constraint(equalTo: playerPhoto.bottomAnchor, constant: 10),
            timeProgress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timeProgress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timeProgress.heightAnchor.constraint(equalToConstant: 17),

            timeLeftLabel.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 10),
            timeLeftLabel.centerXAnchor.constraint(equalTo: timeProgress.centerXAnchor),
            timeLeftLabel.heightAnchor.constraint(equalToConstant: 17),
            timeLeftLabel.widthAnchor.constraint(equalToConstant: 100),

            trainingButton.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 90),
            trainingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),

            fightButton.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 90),
            fightButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            shopButton.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 90),
            shopButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            teamButton.topAnchor.constraint(equalTo: fightButton.bottomAnchor, constant: 40),
            teamButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),

            rankButton.topAnchor.constraint(equalTo: shopButton.bottomAnchor, constant: 40),
            rankButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        ])
    }
}

//
//  PlayerDetailsView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 17/01/2024.
//

import UIKit
import DesignSystem

class PlayerDetailsView: UIView {

    let containerView = ContainerView()

    let playerImage = UIImageView(image: Images.player)
    let playerName = MBLabel(size: 20)
    let playerRecord = MBLabel(size: 16, color: .systemGray2)

    let statView = StatView()

    let dismissButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        backgroundColor = .darkGray.withAlphaComponent(0.7)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PlayerDetailsView {
    func setupView() {
        addSubviews([containerView, playerImage, playerName, playerRecord, statView, dismissButton])

        playerName.textAlignment = .center
        playerRecord.textAlignment = .center

        dismissButton.setTitle("Close", for: .normal)
        dismissButton.backgroundColor = .systemGray2
        dismissButton.layer.cornerRadius = 10

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 600),
            containerView.widthAnchor.constraint(equalToConstant: 293),

            playerImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
            playerImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerImage.heightAnchor.constraint(equalToConstant: 100),
            playerImage.widthAnchor.constraint(equalToConstant: 100),

            playerName.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 10),
            playerName.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerName.heightAnchor.constraint(equalToConstant: 22),
            playerName.widthAnchor.constraint(equalToConstant: 253),

            playerRecord.topAnchor.constraint(equalTo: playerName.bottomAnchor, constant: 2),
            playerRecord.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerRecord.heightAnchor.constraint(equalToConstant: 18),
            playerRecord.widthAnchor.constraint(equalToConstant: 253),

            statView.topAnchor.constraint(equalTo: playerRecord.bottomAnchor, constant: 10),
            statView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            statView.widthAnchor.constraint(equalToConstant: 253),
            statView.heightAnchor.constraint(equalToConstant: 450),

            dismissButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            dismissButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dismissButton.heightAnchor.constraint(equalToConstant: 44),
            dismissButton.widthAnchor.constraint(equalToConstant: 88)
        ])
    }
}

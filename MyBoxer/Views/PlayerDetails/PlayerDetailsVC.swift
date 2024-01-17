//
//  PlayerDetailsVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 20/10/2022.
//

import UIKit

class PlayerDetailsVC: UIViewController {
    
    var player: Player!

    let containerView = ContainerView()
    
    let playerImage = UIImageView(image: Images.player)
    let playerName = MBLabel(size: 20)
    let playerRecord = MBLabel(size: 16, color: .systemGray2)
    
    let statView = StatView()
    
    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        configure()
        configureConstraints()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func set(player: Player) {
        self.player = player
        statView.set(boxer: player)
    }
    
    private func configure() {
        view.addSubviews([containerView, playerImage, playerName, playerRecord, statView, dismissButton])
        
        playerName.text = player.name
        playerName.textAlignment = .center
        
        playerRecord.text = "\(player.record["Wins"]!)/\(player.record["Draws"]!)/\(player.record["Losses"]!)"
        playerRecord.textAlignment = .center
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        playerImage.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.setTitle("Close", for: .normal)
        dismissButton.backgroundColor = .systemGray2
        dismissButton.layer.cornerRadius = 10
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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

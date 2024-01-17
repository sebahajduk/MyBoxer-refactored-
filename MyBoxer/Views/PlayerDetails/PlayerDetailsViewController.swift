//
//  PlayerDetailsVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 20/10/2022.
//

import UIKit

class PlayerDetailsViewController: UIViewController {
    private let playerDetailsView = PlayerDetailsView()

    var player: Player!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        view = playerDetailsView

        playerDetailsView.playerName.text = player.name

        setupButtons()
    }

    func setupPlayer(_ player: Player) {
        self.player = player
        playerDetailsView.statView.set(boxer: player)

        playerDetailsView.playerRecord.text = "\(player.record["Wins"]!)/\(player.record["Draws"]!)/\(player.record["Losses"]!)"
    }

    func setupButtons() {
        playerDetailsView.dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

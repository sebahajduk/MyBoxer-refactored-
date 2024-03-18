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
        setupPlayerDetails()
    }

    private func setupView() {
        view = playerDetailsView

        playerDetailsView.playerName.text = player.name

        setupButtons()
    }

    func setupPlayerDetails() {

        playerDetailsView.statView.set(boxer: player)

        let playerWins = player.record["Wins"] ?? 0
        let playerDraws = player.record["Draws"] ?? 0
        let playerLosses = player.record["Losses"] ?? 0

        playerDetailsView.playerRecord.text = "\(playerWins)/\(playerDraws)/\(playerLosses)"
    }

    func setupButtons() {
        playerDetailsView.dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

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

struct FightingViewUpdateDependencies {
    let roundsLeft: Int
    let movesLeft: Int
    let punchesHistory: [Attack]

    let percentagePlayerHealth: Float
    let percentagePlayerStamina: Float

    let percentageOpponentHealth: Float
    let percentageOpponentStamina: Float
}

final class FightingViewController: UIViewController {
    var presenter: ViewToPresenterFightingProtocol?
    private var fightingView = FightingView()

    private var attackHistory: [Attack] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewLoaded()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter?.viewAppeared()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension FightingViewController: PresenterToViewFightingProtocol {
    func setupInitialData(names: (player: String, opponent: String)) {
        fightingView.setupNames(player: names.player, opponent: names.opponent)
    }

    func updateUI(for data: FightingViewUpdateDependencies) {
        fightingView.updateRoundNumber(to: data.roundsLeft)
        fightingView.updateMovesLeft(to: data.movesLeft)

        fightingView.updatePlayerBars(
            hpBar: data.percentagePlayerHealth,
            staminaBar: data.percentagePlayerStamina
        )

        fightingView.updateOpponentBars(
            hpBar: data.percentageOpponentHealth,
            staminaBar: data.percentageOpponentStamina
        )
        
        attackHistory = data.punchesHistory

        fightingView.updateAttackHistory()
    }

    func showAlert(_ type: AlertType) {
        let alert = AlertViewController(alertType: .youWin)

        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve

        navigationController?.present(alert, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - View setup
private extension FightingViewController {
    func setupView() {
        view = fightingView

        fightingView.attackHistoryTableView.delegate = self
        fightingView.attackHistoryTableView.dataSource = self
    }
}

extension FightingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return attackHistory.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FightingHitCell.reuseID
            ) as? FightingHitCell
        else {
            return UITableViewCell()
        }
        
        cell.set(
            for: attackHistory[indexPath.row]
        )
        
        return cell
    }
}

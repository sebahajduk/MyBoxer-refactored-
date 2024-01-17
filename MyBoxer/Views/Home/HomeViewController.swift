//
//  HomeVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

final class HomeViewController: UIViewController {

    private var homeView = HomeView()

    private var player = Player()

    private var isTimerActive = false
    private var timer: Timer?
    private var timeLeft: TimeInterval?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupButtonTargets()

        setupData()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [self] in
            updateUI()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        startTimer()
        updateUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        saveBoxer()
    }
}

private extension HomeViewController {
    func saveBoxer() {
        Defaults.shared.myBoxer = player
    }

    func setupData() {
        player = Defaults.shared.myBoxer ?? Player()
        player.homeRegeneration(intervals: TimeManagerLocal.shared.timeIntervals)

        switch player.division {
        case .lightweight:
            Boxers.lightweightBoxers.insert(player, at: player.rank)
        case .middleweight:
            Boxers.middleweightBoxers.insert(player, at: player.rank)
        case .heavyweight:
            Boxers.heavyweightBoxers.insert(player, at: player.rank)
        }
    }

    func startTimer() {
        var timerFiredCounter = 0
        if !isTimerActive {
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [self] timer in
                if TimeManagerLocal.shared.inProgres {
                    timeLeft = TimeManagerLocal.shared.getTimeLeft()
                    isTimerActive = true
                    DispatchQueue.main.async { [self] in
                        homeView.timeProgress.setProgress(Float((timeLeft ?? 0) / Defaults.shared.actionTime), animated: true)
                        homeView.timeLeftLabel.text = DateComponentsFormatter().string(from: timeLeft!)!
                    }
                } else {
                    if timerFiredCounter == 1500 {
                        player.homeRegeneration(intervals: 1)
                        updateUI()
                        timerFiredCounter = 0
                    }
                    timerFiredCounter += 1
                    homeView.timeLeftLabel.text = ""

                    stopTimer()
                }
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        isTimerActive = false

        homeView.timeProgress.setProgress(0, animated: true)
    }

    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            homeView.updateProgressBars(
                (
                    health: Float(player.hp/player.vitality),
                    stamina: Float(player.stamina/player.fullStamina),
                    experience: Float(player.experience/player.nextLevel)
                )
            )

            homeView.updateCoinValueTo(player.money)
        }
    }
}

// MARK: - Configuring Views
private extension HomeViewController {
    private func setupView() {
        view = homeView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),style: .plain, target: self, action: #selector(pushDetailVC))
    }

    private func setupButtonTargets() {
        homeView.trainingButton.addTarget(self, action: #selector(pushTrainingVC), for: .touchUpInside)
        homeView.fightButton.addTarget(self, action: #selector(pushOpponentsVC), for: .touchUpInside)
        homeView.shopButton.addTarget(self, action: #selector(pushShopVC), for: .touchUpInside)
        homeView.teamButton.addTarget(self, action: #selector(pushTeamVC), for: .touchUpInside)
        homeView.rankButton.addTarget(self, action: #selector(pushRankVC), for: .touchUpInside)
    }
}

@objc
extension HomeViewController {
    func pushRankVC() {
        let rankVC = RankVC()

        navigationController!.pushViewController(rankVC, animated: true)
    }

    func pushDetailVC() {
        let detailVC = PlayerDetailsViewController()

        detailVC.setupPlayer(player)

        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.modalTransitionStyle = .crossDissolve

        navigationController!.present(detailVC, animated: true)
    }

    func pushTrainingVC() {
        let trainingVC = TrainingVC(myBoxer: player)

        navigationController!.pushViewController(trainingVC, animated: true)
    }

    func pushOpponentsVC() {
        let opponentsVC = OpponentsVC(player: player)

        navigationController!.pushViewController(opponentsVC, animated: true)
    }

    func pushShopVC() {
        let shopVC = ShopVC(player: player)

        navigationController!.pushViewController(shopVC, animated: true)
    }

    func pushTeamVC() {
        let teamVC = TeamVC(player: player)

        navigationController!.pushViewController(teamVC, animated: true)
    }
}

//
//  HomeVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    private var homeView = HomeView()

    var presenter: ViewToPresenterHomeModuleProtocol?

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
            BoxersRepository.lightweightBoxers.insert(player, at: player.rank)
        case .middleweight:
            BoxersRepository.middleweightBoxers.insert(player, at: player.rank)
        case .heavyweight:
            BoxersRepository.heavyweightBoxers.insert(player, at: player.rank)
        }
    }

    func startTimer() {
        var timerFiredCounter = 0
        if !isTimerActive {
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [self] timer in
                if TimeManagerLocal.shared.inProgres {
                    let timeLeft = TimeManagerLocal.shared.getTimeLeft()

                    isTimerActive = true
                    homeView.timeProgress.setProgress(Float((timeLeft) / Defaults.shared.actionTime), animated: true)
                    
                    if let formattedTimeLeft = DateComponentsFormatter().string(from: timeLeft) {
                        homeView.timeLeftLabel.text = formattedTimeLeft
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
            homeView.updateProgressBarsFill(
                (
                    health: Float(player.hp/player.vitality),
                    stamina: Float(player.stamina/player.fullStamina),
                    experience: Float(player.experience/player.nextLevel)
                )
            )
            
            homeView.updateProgressBarsValue((health: player.hp, stamina: player.stamina, experience: player.experience))
            homeView.updateCoinValueTo(player.money)
        }
    }
}

// MARK: - Configuring Views
private extension HomeViewController {
    private func setupView() {
        view = homeView
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal"),
            style: .plain,
            target: self,
            action: #selector(detailButtonTapped))
    }

    private func setupButtonTargets() {
        homeView.trainingButton.addTarget(self, action: #selector(trainingButtonTapped), for: .touchUpInside)
        homeView.fightButton.addTarget(self, action: #selector(opponentsButtonTapped), for: .touchUpInside)
        homeView.shopButton.addTarget(self, action: #selector(shopButtonTapped), for: .touchUpInside)
        homeView.teamButton.addTarget(self, action: #selector(teamButtonTapped), for: .touchUpInside)
        homeView.rankButton.addTarget(self, action: #selector(rankButtonTapped), for: .touchUpInside)
    }
}

extension HomeViewController: PresenterToViewHomeModuleProtocol {
    func updateCoinValueTo(_ value: Int) {

    }

    func updateProgressBarsFill(_ fillPercent: (health: Float, stamina: Float, experience: Float)) {

    }

    func updateProgressBarsValue<T>(_ value: (health: T, stamina: T, experience: T)) where T : Numeric {

    }
}

@objc
extension HomeViewController {
    func rankButtonTapped() {
        guard let navigationController else { return }

        presenter?.rankButtonTapped(navigationController)
    }

    func detailButtonTapped() {
        guard let navigationController else { return }

        presenter?.detailsButtonTapped(navigationController)
    }

    func trainingButtonTapped() {
        guard let navigationController else { return }

        presenter?.trainingButtonTapped(
            navigationController,
            player: player
        )
    }

    func opponentsButtonTapped() {
        guard let navigationController else { return }

        presenter?.opponentsButtonTapped(
            navigationController,
            player: player
        )
    }

    func shopButtonTapped() {
        guard let navigationController else { return }

        presenter?.shopButtonTapped(navigationController, player: player)
    }

    func teamButtonTapped() {
        guard let navigationController else { return }

        presenter?.teamButtonTapped(navigationController, player: player)
    }
}

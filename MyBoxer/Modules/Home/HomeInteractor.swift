//
//  HomeInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/01/2024.
//

import Foundation

final class HomeInteractor {
    weak var presenter: InteractorToPresenterHomeModuleCommunicator?
    private var player = Player()
    private var timeHandler = TimeHandler()
    private var isTimerActive = false
    private var timer: Timer?
    private var timeLeft: TimeInterval?
}

extension HomeInteractor: PresenterToInteractorHomeModuleCommunicator {
    func setupData() {
        player = Defaults.shared.myBoxer ?? Player()
        player.homeRegeneration(intervals: timeHandler.timeIntervals)

        switch player.division {
        case .lightweight:
            BoxersRepository.lightweightBoxers.insert(player, at: player.rank)
        case .middleweight:
            BoxersRepository.middleweightBoxers.insert(player, at: player.rank)
        case .heavyweight:
            BoxersRepository.heavyweightBoxers.insert(player, at: player.rank)
        }

        let homeDependencies = setupHomeDependencies()

        presenter?.playerLoaded(with: homeDependencies)
    }

    func getPlayerObject() -> Player {
        player
    }

    func getTimeHandler() -> TimeHandler {
        timeHandler
    }

    func startTimer() {
        var timerFiredCounter = 0
        var timeLeftAsString = ""
        var timerProgress: Float = 0.0

        if !isTimerActive {
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [weak self] timer in
                guard let self else { return }
                if timeHandler.inProgres {
                    let timeLeft = timeHandler.getTimeLeft()

                    isTimerActive = true
                    timerProgress = Float((timeLeft) / Defaults.shared.actionTime)

                    if let formattedTimeLeft = DateComponentsFormatter().string(from: timeLeft) {
                        timeLeftAsString = formattedTimeLeft
                        presenter?.updateTimer(with: timeLeftAsString, barProgress: timerProgress)
                    }

                } else {
                    if timerFiredCounter == 1500 {
                        player.homeRegeneration(intervals: 1)

                        timerFiredCounter = 0
                    }
                    timerFiredCounter += 1
                    
                    timeLeftAsString = ""
                    timerProgress = 0.0
                    presenter?.updateTimer(with: timeLeftAsString, barProgress: timerProgress)
                    stopTimer()
                }
            }
        }
    }
}

private extension HomeInteractor {
    func stopTimer() {
        timer?.invalidate()
        isTimerActive = false
    }

    func setupHomeDependencies() -> HomeDependencies {
        let barsPercentage = (
            health: Float(player.hp / player.vitality),
            stamina: Float(player.stamina / player.fullStamina),
            experience: Float(player.experience / player.nextLevel)
        )

        let barsValues = (
            health: player.hp,
            stamina: player.stamina,
            experience: player.experience
        )

        let homeDependencies = HomeDependencies(
            barsPercentage: barsPercentage,
            barsValues: barsValues,
            money: player.money
        )

        return homeDependencies
    }
}

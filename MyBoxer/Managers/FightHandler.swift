//
//  FightHandler.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

typealias Names = (player: String, opponent: String)

protocol Fightable: AnyObject {
    func updateData(_ data: FightingViewUpdateDependencies)
    func fightFinished(with result: FightResults)
}

final class FightHandler {
    weak var interactor: (any Fightable)?
    
    private var player: Player
    private var opponent: Opponent
    
    private var attackHistory = [Attack]()
    private var moves = 20
    private var round = 1
    private var timer: Timer?
    
    init(player: Player, opponent: Opponent) {
        self.player = player
        self.opponent = opponent
    }
}

extension FightHandler {
    func startFight() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.startTimer()
        }
    }

    func getBoxersNames() -> Names {
        (player: player.name, opponent: opponent.name)
    }
}

private extension FightHandler {
    func startTimer() {
        var timerCounter = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self else { return }

            var attack: Attack
            var damage: Double

            if timerCounter % 2 == 0 {
                damage = Attack.hit(attacker: player, defender: opponent)
                print("You did: \(damage)")
                if damage > opponent.hp {
                    damage = opponent.hp
                }
                    
                opponent.hp -= damage

                attack = Attack(attacker: .player, damage: damage)
            } else {
                damage = Attack.hit(attacker: opponent, defender: player)

                if damage > player.hp {
                    damage = player.hp
                }

                player.hp -= damage

                attack = Attack(attacker: .opponent, damage: damage)
            }

            attackHistory.insert(attack, at: 0)
            timerCounter += 1
            self.checkStatus()
        }
    }

    func checkStatus() {
        if moves > 0 {
            self.moves -= 1
        } else if round < 10 {
            finishRound()
        } else {
            finishFight()
        }

        if player.hp <= 0 {
            finishFight()
            interactor?.fightFinished(with: .defeat)
            player.fightFinished(against: opponent, result: .defeat)
        } else if opponent.hp <= 0 {
            finishFight()
            interactor?.fightFinished(with: .victory)
            player.fightFinished(against: opponent, result: .victory)
            RankManager.rankUp(winner: player)
        }

        let percentagePlayerHealth = Float(player.hp / player.vitality)
        let percentagePlayerStamina = Float(player.stamina / player.fullStamina)

        let percentageOpponentHealth = Float(opponent.hp / opponent.vitality)
        let percentageOpponentStamina = Float(opponent.stamina / opponent.fullStamina)

        let dependendencies = FightingViewUpdateDependencies(
            roundsLeft: round,
            movesLeft: moves,
            punchesHistory: attackHistory,
            percentagePlayerHealth: percentagePlayerHealth,
            percentagePlayerStamina: percentagePlayerStamina,
            percentageOpponentHealth: percentageOpponentHealth,
            percentageOpponentStamina: percentageOpponentStamina
        )

        interactor?.updateData(dependendencies)
    }

    func finishRound() {
        self.round += 1
        self.moves = 20
        opponent.regeneration()
        player.regeneration(multiplier: player.fightRegeneration)
    }

    func finishFight() {
        timer?.invalidate()
    }
}

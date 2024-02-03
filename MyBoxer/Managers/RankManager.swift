//
//  RankManager.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 28/11/2022.
//

import Foundation

struct RankManager {

    static func rankUp(winner: Player) {
        removeFromRank(player: winner)

        switch winner.division {
        case .lightweight:
            if winner.rank < BoxersRepository.lightweightBoxers.count {
                winner.rankUp()
                BoxersRepository.lightweightBoxers.insert(winner.self, at: winner.rank)
            } else {
                winner.promote()
                BoxersRepository.middleweightBoxers.insert(winner.self, at: winner.rank)
            }

        case .middleweight:
            if winner.rank < BoxersRepository.middleweightBoxers.count {
                winner.rankUp()
                BoxersRepository.middleweightBoxers.insert(winner.self, at: winner.rank)
            } else {
                winner.promote()
                BoxersRepository.heavyweightBoxers.insert(winner.self, at: winner.rank)
            }

        case .heavyweight:
            if winner.rank < BoxersRepository.heavyweightBoxers.count {
                winner.rankUp()
                BoxersRepository.heavyweightBoxers.insert(winner.self, at: winner.rank)
            } else {
                winner.promote()
            }
        }
    }

    static func removeFromRank(player: Player) {
        switch player.division {
        case .lightweight:
            guard let index = BoxersRepository.lightweightBoxers.firstIndex(where: {$0.name == player.name}) else { return }
            BoxersRepository.lightweightBoxers.remove(at: index)
        case .middleweight:
            guard let index = BoxersRepository.middleweightBoxers.firstIndex(where: {$0.name == player.name}) else { return }
            BoxersRepository.middleweightBoxers.remove(at: index)
        case .heavyweight:
            guard let index = BoxersRepository.heavyweightBoxers.firstIndex(where: {$0.name == player.name}) else { return }
            BoxersRepository.heavyweightBoxers.remove(at: index)
        }
    }
}

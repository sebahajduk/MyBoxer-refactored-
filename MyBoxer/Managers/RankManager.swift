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
            if winner.rank < Boxers.lightweightBoxers.count {
                winner.rankUp()
                Boxers.lightweightBoxers.insert(winner.self, at: winner.rank)
            } else {
                winner.promote()
                Boxers.middleweightBoxers.insert(winner.self, at: winner.rank)
            }
        
        case .middleweight:
           if winner.rank < Boxers.middleweightBoxers.count {
                winner.rankUp()
                Boxers.middleweightBoxers.insert(winner.self, at: winner.rank)
            } else {
                winner.promote()
                Boxers.heavyweightBoxers.insert(winner.self, at: winner.rank)
            }
            
        case .heavyweight:
            if winner.rank < Boxers.heavyweightBoxers.count {
                winner.rankUp()
                Boxers.heavyweightBoxers.insert(winner.self, at: winner.rank)
            } else {
                winner.promote()
            }
        }
    }
    
    static func removeFromRank(player: Player) {
        switch player.division {
        case .lightweight:
            guard let index = Boxers.lightweightBoxers.firstIndex(where: {$0.name == player.name}) else { return }
            Boxers.lightweightBoxers.remove(at: index)
        case .middleweight:
            guard let index = Boxers.middleweightBoxers.firstIndex(where: {$0.name == player.name}) else { return }
            Boxers.middleweightBoxers.remove(at: index)
        case .heavyweight:
            guard let index = Boxers.heavyweightBoxers.firstIndex(where: {$0.name == player.name}) else { return }
            Boxers.heavyweightBoxers.remove(at: index)
        }
    }
    
}

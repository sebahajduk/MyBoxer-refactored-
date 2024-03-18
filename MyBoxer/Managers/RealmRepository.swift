//
//  RealmRepository.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 05/02/2024.
//

import Foundation
import RealmSwift

protocol RealmRepositorable {
    func getPlayer() -> Player
    func savePlayer(completion: () -> ())
}

final class RealmRepository {
    private var realm: Realm!
    private var player: Player?

    init() {
        realm = try! Realm()

        if realm.objects(Player.self).isEmpty {
            try? realm.write {
                realm.add(Player())
            }
        } else {
            player = realm.objects(Player.self).first
        }
    }
}

extension RealmRepository: RealmRepositorable {
    func getPlayer() -> Player {
        return player ?? Player()
    }

    func savePlayer(completion: () -> ()) {
        if let player {
            do {
                try realm.write {
                    completion()
                }
            } catch {
                // TODO: Error handling
                print("There was an error saving player.")
            }
        }
    }
}

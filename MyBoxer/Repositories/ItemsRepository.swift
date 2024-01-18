//
//  ItemsRepository.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/01/2024.
//

import Foundation

final class ItemsRepository {
    let gloves: [Item] = [
        Item(id: 0, name: "Boxing glove", stats: 3, cost: 15, type: .gloves),
        Item(id: 1, name: "Boxing glove", stats: 5, cost: 25, type: .gloves),
        Item(id: 2, name: "Boxing glove", stats: 7, cost: 40, type: .gloves),
        Item(id: 3, name: "Boxing glove", stats: 11, cost: 60, type: .gloves),
        Item(id: 4, name: "Boxing glove", stats: 13, cost: 90, type: .gloves),
    ]

    let boots: [Item] = [
        Item(id: 5, name: "Boxing boots", stats: 3, cost: 15, type: .boots),
        Item(id: 6, name: "Boxing boots", stats: 5, cost: 25, type: .boots),
        Item(id: 7, name: "Boxing boots", stats: 7, cost: 40, type: .boots),
        Item(id: 8, name: "Boxing boots", stats: 11, cost: 60, type: .boots),
        Item(id: 9, name: "Boxing boots", stats: 13, cost: 90, type: .boots),
    ]

    let shorts: [Item] = [
        Item(id: 10, name: "Boxing shorts", stats: 3, cost: 15, type: .shorts),
        Item(id: 11, name: "Boxing shorts", stats: 5, cost: 25, type: .shorts),
        Item(id: 12, name: "Boxing shorts", stats: 7, cost: 40, type: .shorts),
        Item(id: 13, name: "Boxing shorts", stats: 11, cost: 60, type: .shorts),
        Item(id: 14, name: "Boxing shorts", stats: 13, cost: 90, type: .shorts),
    ]

    let tapes: [Item] = [
        Item(id: 15, name: "Boxing tapes", stats: 3, cost: 15, type: .tapes),
        Item(id: 16, name: "Boxing tapes", stats: 5, cost: 25, type: .tapes),
        Item(id: 17, name: "Boxing tapes", stats: 7, cost: 40, type: .tapes),
        Item(id: 18, name: "Boxing tapes", stats: 11, cost: 60, type: .tapes),
        Item(id: 19, name: "Boxing tapes", stats: 13, cost: 90, type: .tapes),
    ]
}

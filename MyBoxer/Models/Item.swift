//
//  Item.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 11/10/2022.
//

import UIKit

enum ItemType {
    case gloves, boots, shorts, tapes
}

struct Item {
    let id: Int
    let name: String
    let stats: Double
    let cost: Int
    let type: ItemType
    var image: UIImage! = Images.boxingGlove
    
    init(id: Int, name: String, stats: Double, cost: Int, type: ItemType) {
        self.id = id
        self.name = name
        self.stats = stats
        self.cost = cost
        self.type = type
        
        switch type {
        case .gloves:
            image = Images.boxingGlove
        case .boots:
            image = Images.boxingBoots
        case .shorts:
            image = Images.boxingShorts
        case .tapes:
            image = Images.boxingTapes
        }
    }
}

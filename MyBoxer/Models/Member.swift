//
//  Member.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/11/2022.
//

import UIKit

enum MemberType {
    case manager, coach, cutman, physio
}

struct Member {
    let name: String
    let stats: Int
    let price: Int
    let type: MemberType
    
    var image: UIImage
    
    init(name: String, stats: Int, price: Int, type: MemberType) {
        self.name = name
        self.stats = stats
        self.price = price
        self.type = type
        
        switch type {
        case .manager:
            image = Images.managerImage
        case .coach:
            image = Images.coachImage
        case .cutman:
            image = Images.cutmanImage
        case .physio:
            image = Images.physioImage
        }
    }
    
}

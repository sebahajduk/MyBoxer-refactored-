//
//  TeamRepository.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/01/2024.
//

import Foundation

final class TeamRepository {
    let managers: [Member] = [
        Member(name: "Horace Hines", stats: 2, price: 300, type: .manager),
        Member(name: "Shawn Bennett", stats: 5, price: 800, type: .manager),
        Member(name: "Halbert Rowse", stats: 7, price: 1200, type: .manager),
        Member(name: "Jack Swanson", stats: 10, price: 2000, type: .manager),
        Member(name: "Herman Nichols", stats: 15, price: 3500, type: .manager)
    ]

    let coaches: [Member] = [
        Member(name: "Dane Lawrence", stats: 2, price: 300, type: .coach),
        Member(name: "Ryan Pierpoint", stats: 5, price: 800, type: .coach),
        Member(name: "Ray Warner", stats: 7, price: 1200, type: .coach),
        Member(name: "Tristan Buckley", stats: 10, price: 2000, type: .coach),
        Member(name: "Cecil Wolfe", stats: 15, price: 3500, type: .coach)
    ]

    let cutmans: [Member] = [
        Member(name: "Davy Mendoza", stats: 2, price: 300, type: .cutman),
        Member(name: "Hanley Chasey", stats: 5, price: 800, type: .cutman),
        Member(name: "Frederick Lucas", stats: 7, price: 1200, type: .cutman),
        Member(name: "Russ Steele", stats: 10, price: 2000, type: .cutman),
        Member(name: "Marsh Carr", stats: 15, price: 3500, type: .cutman)
    ]

    let physios: [Member] = [
        Member(name: "Jerry Bates", stats: 2, price: 300, type: .physio),
        Member(name: "Justin Hodgson", stats: 5, price: 800, type: .physio),
        Member(name: "Sylvester Harris", stats: 7, price: 1200, type: .physio),
        Member(name: "Franklin Olson", stats: 10, price: 2000, type: .physio),
        Member(name: "Errol Floyd", stats: 15, price: 3500, type: .physio)
    ]
}

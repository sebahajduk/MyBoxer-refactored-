//
//  TrainingsRepository.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

struct TrainingsRepository {
    static let trainings: [Training] = [
        Training(type: .shadowBoxing),
        Training(type: .weightLifting),
        Training(type: .jumpingRope),
        Training(type: .ballThrow),
        Training(type: .intervals)
    ]
}

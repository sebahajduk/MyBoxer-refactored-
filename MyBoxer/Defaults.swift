//
//  Defaults.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/10/2022.
//

import Foundation

class Defaults {
    static let shared = Defaults()
    
    let defaults = UserDefaults.standard
    
    private let keyActionEndAt = "actionEndAt"
    private let keyActionTime = "actionTime"
    private let keyMyBoxer = "myBoxer"
    
    var actionEndAt: Date? {
        set {
            defaults.setValue(newValue, forKey: keyActionEndAt)
        }
        get {
            return defaults.object(forKey: keyActionEndAt) as? Date
        }
    }
    
    var actionTime: Double {
        set {
            defaults.setValue(newValue, forKey: keyActionTime)
        }
        get {
            return defaults.double(forKey: keyActionTime)
        }
    }
}

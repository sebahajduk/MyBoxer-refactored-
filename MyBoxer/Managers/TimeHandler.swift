//
//  TimeHandler.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 04/10/2022.
//

import Foundation

class TimeHandler {
    
    var now = Date.now
    var endedTime: Date!
    var timeLeft: TimeInterval = 0.5
    var inProgres: Bool = false
    var trainingTime: Double = 1
    var timeIntervals: Int = 0
    
    func train(for time: Double) {
        now = Date.now
        trainingTime = time
        endedTime = now.addingTimeInterval(time)
        inProgres = true
        
        Defaults.shared.actionEndAt = endedTime
        Defaults.shared.actionTime = time
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] timer in
            now = Date.now
            if endedTime < now {
                inProgres = false
                timer.invalidate()
            }
        }
    }
    
    func getTimeLeft() -> TimeInterval {
        now = Date.now
        timeLeft = endedTime.timeIntervalSinceReferenceDate - now.timeIntervalSinceReferenceDate
        return timeLeft
    }
    
    init() {
        loadData()
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] timer in
            now = Date.now
            if endedTime < now {
                inProgres = false
                timer.invalidate()
            } else {
                inProgres = true
            }
        }
    }
    
    private func loadData() {
        endedTime = Defaults.shared.actionEndAt
        if Defaults.shared.actionEndAt ?? Date.now > Date.now {
            startTimer()
        } else {
            guard let endedTime else { return }
            let restingTime: TimeInterval = Date.now.timeIntervalSinceReferenceDate - endedTime.timeIntervalSinceReferenceDate
            timeIntervals = Int(restingTime / 1)
            Defaults.shared.actionEndAt = Date.now
        }
    }
}

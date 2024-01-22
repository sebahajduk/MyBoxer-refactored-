//
//  StatView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 23/11/2022.
//

import UIKit

class StatView: UIView {
    
    var boxer: Boxer?
    
    let level: SingleStatView = SingleStatView(statType: .level)
    let vitality: SingleStatView = SingleStatView(statType: .vitality)
    let punchPower: SingleStatView = SingleStatView(statType: .power)
    let punchSpeed: SingleStatView = SingleStatView(statType: .speed)
    let footwork: SingleStatView = SingleStatView(statType: .footwork)
    let movement: SingleStatView = SingleStatView(statType: .movement)
    let defence: SingleStatView = SingleStatView(statType: .defence)
    let endurance: SingleStatView = SingleStatView(statType: .endurance)
    
    let moneyMultiplier: SingleStatView = SingleStatView(statType: .moneyMultiplier)
    let trainingEffect: SingleStatView = SingleStatView(statType: .trainingEffect)
    let homeRegeneration: SingleStatView = SingleStatView(statType: .homeRegeneration)
    let fightRegeneration: SingleStatView = SingleStatView(statType: .fightRegeneration)

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    func set(boxer: Boxer) {
        self.boxer = boxer
        
        if boxer is Player {
            configureForPlayer()
            setValuesForPlayer()
        } else {
            configure()
        }
        
        setValues()
    }
    
    private func setValues() {
        guard let boxer else { return }
        vitality.set(value: boxer.vitality)
        punchPower.set(value: boxer.punchPower)
        punchSpeed.set(value: boxer.punchSpeed)
        footwork.set(value: boxer.footwork)
        movement.set(value: boxer.movement)
        defence.set(value: boxer.defence)
        endurance.set(value: boxer.endurance)
    }
    
    private func setValuesForPlayer() {
        let player = boxer as! Player
        level.set(value: Double(player.currentLevel))
        moneyMultiplier.set(value: player.moneyMultiplier)
        trainingEffect.set(value: player.trainingEffect)
        homeRegeneration.set(value: player.homeRegeneration)
        fightRegeneration.set(value: player.fightRegeneration)
    }
    
    private func configure() {
        addSubviews([vitality, punchPower, punchSpeed, footwork, movement, defence, endurance])
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vitality.topAnchor.constraint(equalTo: topAnchor),
            vitality.leadingAnchor.constraint(equalTo: leadingAnchor),
            vitality.trailingAnchor.constraint(equalTo: trailingAnchor),
            vitality.heightAnchor.constraint(equalToConstant: 20),
            
            punchPower.topAnchor.constraint(equalTo: vitality.bottomAnchor, constant: 2),
            punchPower.leadingAnchor.constraint(equalTo: leadingAnchor),
            punchPower.trailingAnchor.constraint(equalTo: trailingAnchor),
            punchPower.heightAnchor.constraint(equalToConstant: 20),
            
            punchSpeed.topAnchor.constraint(equalTo: punchPower.bottomAnchor, constant: 2),
            punchSpeed.leadingAnchor.constraint(equalTo: leadingAnchor),
            punchSpeed.trailingAnchor.constraint(equalTo: trailingAnchor),
            punchSpeed.heightAnchor.constraint(equalToConstant: 20),
            
            footwork.topAnchor.constraint(equalTo: punchSpeed.bottomAnchor, constant: 2),
            footwork.leadingAnchor.constraint(equalTo: leadingAnchor),
            footwork.trailingAnchor.constraint(equalTo: trailingAnchor),
            footwork.heightAnchor.constraint(equalToConstant: 20),
            
            movement.topAnchor.constraint(equalTo: footwork.bottomAnchor, constant: 2),
            movement.leadingAnchor.constraint(equalTo: leadingAnchor),
            movement.trailingAnchor.constraint(equalTo: trailingAnchor),
            movement.heightAnchor.constraint(equalToConstant: 20),
            
            defence.topAnchor.constraint(equalTo: movement.bottomAnchor, constant: 2),
            defence.leadingAnchor.constraint(equalTo: leadingAnchor),
            defence.trailingAnchor.constraint(equalTo: trailingAnchor),
            defence.heightAnchor.constraint(equalToConstant: 20),
            
            endurance.topAnchor.constraint(equalTo: defence.bottomAnchor, constant: 2),
            endurance.leadingAnchor.constraint(equalTo: leadingAnchor),
            endurance.trailingAnchor.constraint(equalTo: trailingAnchor),
            endurance.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureForPlayer() {
        addSubviews([level, vitality, punchPower, punchSpeed, footwork, movement, defence, endurance, moneyMultiplier, trainingEffect, homeRegeneration, fightRegeneration])
        
        translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            level.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            level.centerXAnchor.constraint(equalTo: centerXAnchor),
            level.heightAnchor.constraint(equalToConstant: 20),
            level.widthAnchor.constraint(equalToConstant: 253),
            
            vitality.topAnchor.constraint(equalTo: level.bottomAnchor, constant: 2),
            vitality.centerXAnchor.constraint(equalTo: centerXAnchor),
            vitality.heightAnchor.constraint(equalToConstant: 20),
            vitality.widthAnchor.constraint(equalToConstant: 253),
            
            punchPower.topAnchor.constraint(equalTo: vitality.bottomAnchor, constant: 2),
            punchPower.centerXAnchor.constraint(equalTo: centerXAnchor),
            punchPower.heightAnchor.constraint(equalToConstant: 20),
            punchPower.widthAnchor.constraint(equalToConstant: 253),
            
            punchSpeed.topAnchor.constraint(equalTo: punchPower.bottomAnchor, constant: 2),
            punchSpeed.centerXAnchor.constraint(equalTo: centerXAnchor),
            punchSpeed.heightAnchor.constraint(equalToConstant: 20),
            punchSpeed.widthAnchor.constraint(equalToConstant: 253),
            
            footwork.topAnchor.constraint(equalTo: punchSpeed.bottomAnchor, constant: 2),
            footwork.centerXAnchor.constraint(equalTo: centerXAnchor),
            footwork.heightAnchor.constraint(equalToConstant: 20),
            footwork.widthAnchor.constraint(equalToConstant: 253),
            
            movement.topAnchor.constraint(equalTo: footwork.bottomAnchor, constant: 2),
            movement.centerXAnchor.constraint(equalTo: centerXAnchor),
            movement.heightAnchor.constraint(equalToConstant: 20),
            movement.widthAnchor.constraint(equalToConstant: 253),
            
            defence.topAnchor.constraint(equalTo: movement.bottomAnchor, constant: 2),
            defence.centerXAnchor.constraint(equalTo: centerXAnchor),
            defence.heightAnchor.constraint(equalToConstant: 20),
            defence.widthAnchor.constraint(equalToConstant: 253),
            
            endurance.topAnchor.constraint(equalTo: defence.bottomAnchor, constant: 2),
            endurance.centerXAnchor.constraint(equalTo: centerXAnchor),
            endurance.heightAnchor.constraint(equalToConstant: 20),
            endurance.widthAnchor.constraint(equalToConstant: 253),
            
            moneyMultiplier.topAnchor.constraint(equalTo: endurance.bottomAnchor, constant: 2),
            moneyMultiplier.centerXAnchor.constraint(equalTo: centerXAnchor),
            moneyMultiplier.heightAnchor.constraint(equalToConstant: 20),
            moneyMultiplier.widthAnchor.constraint(equalToConstant: 253),
            
            trainingEffect.topAnchor.constraint(equalTo: moneyMultiplier.bottomAnchor, constant: 2),
            trainingEffect.centerXAnchor.constraint(equalTo: centerXAnchor),
            trainingEffect.heightAnchor.constraint(equalToConstant: 20),
            trainingEffect.widthAnchor.constraint(equalToConstant: 253),
            
            homeRegeneration.topAnchor.constraint(equalTo: trainingEffect.bottomAnchor, constant: 2),
            homeRegeneration.centerXAnchor.constraint(equalTo: centerXAnchor),
            homeRegeneration.heightAnchor.constraint(equalToConstant: 20),
            homeRegeneration.widthAnchor.constraint(equalToConstant: 253),
            
            fightRegeneration.topAnchor.constraint(equalTo: homeRegeneration.bottomAnchor, constant: 2),
            fightRegeneration.centerXAnchor.constraint(equalTo: centerXAnchor),
            fightRegeneration.heightAnchor.constraint(equalToConstant: 20),
            fightRegeneration.widthAnchor.constraint(equalToConstant: 253)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  FightingHitCell.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 06/11/2022.
//

import UIKit

enum Attacker {
    case player, opponent
}

class FightingHitCell: UITableViewCell {
    
    static let reuseID = "FightingHitCell"
    var attacker: Attacker = .player
    var damage: Double = 0.0
    
    let message = MBLabel(size: 15)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(for attack: Attack) {
        self.attacker = attack.attacker
        self.damage = attack.damage
        
        let stringDamage = String(format: "%.2f", damage)
        
        switch attacker {
        case .player:
            backgroundColor = .systemCyan.withAlphaComponent(0.2)
            
            if damage > 0.00001 {
                message.text = "You dealt \(stringDamage) damage"
            } else if damage == 0.00001 {
                message.text = "You are exhausted"
            } else {
                message.text = "You missed"
            }
            
        case .opponent:
            backgroundColor = .systemRed.withAlphaComponent(0.2)
            
            if damage > 0 {
                message.text = "Opponent hit you for \(stringDamage)"
            } else {
                message.text = "Opponent missed"
            }
        }
    }

    private func configure() {
        addSubview(message)
        
        message.textAlignment = .center
        
        NSLayoutConstraint.activate([
            message.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            message.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            message.heightAnchor.constraint(equalTo: self.heightAnchor),
            message.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}

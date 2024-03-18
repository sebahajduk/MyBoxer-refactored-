//
//  OpponentStatView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/10/2022.
//

import UIKit

public enum Stats {
    case vitality, power, speed, footwork, movement, defence, endurance, level, moneyMultiplier, trainingEffect, fightRegeneration, homeRegeneration
}

@available(iOS 16.0, *)
public class SingleStatView: UIView {

    let stat = MBLabel(size: 16, color: .systemGray2)
    var statValue = MBLabel(size: 16, color: .systemGray2, alignment: .right)
    var value: Double = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    public convenience init(statType: Stats, value: Double = 4) {
        self.init(frame: .zero)
        
        set(value: value)
        configure(statType: statType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(value: Double) {
        self.value = value
        statValue.text = "\(value)"
    }
    
    private func configure(statType: Stats) {
        addSubviews([stat, statValue])
        
        switch statType {
        case .vitality:
            stat.text = "vitality"
        case .power:
            stat.text = "power"
        case .speed:
            stat.text = "speed"
        case .footwork:
            stat.text = "footwork"
        case .movement:
            stat.text = "movement"
        case .defence:
            stat.text = "defence"
        case .endurance:
            stat.text = "endurance"
        case .level:
            stat.text = "level"
            stat.textColor = .label
            statValue.textColor = .label
        case .moneyMultiplier:
            stat.text = "Money multiplier"
        case .trainingEffect:
            stat.text = "training Effect"
        case .fightRegeneration:
            stat.text = "fight Regeneration"
        case .homeRegeneration:
            stat.text = "home Regeneration"
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat.topAnchor.constraint(equalTo: self.topAnchor),
            stat.leadingAnchor.constraint(equalTo: leadingAnchor),
            stat.widthAnchor.constraint(equalToConstant: 150),
            stat.heightAnchor.constraint(equalToConstant: 16),
            
            statValue.centerYAnchor.constraint(equalTo: stat.centerYAnchor),
            statValue.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            statValue.widthAnchor.constraint(equalToConstant: 50),
            statValue.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
}

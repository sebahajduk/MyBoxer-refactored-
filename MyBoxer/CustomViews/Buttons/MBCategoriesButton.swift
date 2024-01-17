//
//  MBShopMenuButton.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 13/10/2022.
//

import UIKit

enum ButtonStyle {
    case gloves, boots, shorts, tapes, manager, coach, cutman, physio
}

class MBCategoriesButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type: ButtonStyle) {
        self.init()
        configure(type: type)
    }
    
    private func configure(type: ButtonStyle) {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .gloves:
            setTitle("gloves", for: .normal)
        case .boots:
            setTitle("boots", for: .normal)
        case .shorts:
            setTitle("shorts", for: .normal)
        case .tapes:
            setTitle("tapes", for: .normal)
        case .manager:
            setTitle("managers", for: .normal)
        case .coach:
            setTitle("coaches", for: .normal)
        case .cutman:
            setTitle("cutmans", for: .normal)
        case .physio:
            setTitle("physio", for: .normal)
        }
        
        titleLabel?.font = UIFont(name: "college", size: 15)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 30),
            widthAnchor.constraint(equalToConstant: 80)
        ])
    }

}

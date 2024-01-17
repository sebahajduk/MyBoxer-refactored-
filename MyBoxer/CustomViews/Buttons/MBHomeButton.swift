//
//  MBButton.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 23/09/2022.
//

import UIKit

class MBHomeButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: UIImage) {
        self.init()
        configure(image: image)
    }
    
    private func configure(image: UIImage) {
        setBackgroundImage(image, for: .normal)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 80),
            widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

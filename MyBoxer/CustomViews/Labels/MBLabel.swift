//
//  MBLabel.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/10/2022.
//

import UIKit

class MBLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(size: CGFloat, color: UIColor = .label, alignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        
        configure(size: size, color: color, alignment: alignment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(size: CGFloat, color: UIColor, alignment: NSTextAlignment) {
        font = UIFont(name: "college", size: size)
        textColor = color
        textAlignment = alignment
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  MBImageView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

class MBImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  ContainerView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 20/10/2022.
//

import UIKit

@available(iOS 16.0, *)
public class ContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }

}

//
//  MBShopMenu.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 13/10/2022.
//

import UIKit

@available(iOS 16.0, *)
public class MBShopMenu: UIView {

    public let buttonGloves = MBCategoriesButton(type: .gloves)
    public let buttonBoots = MBCategoriesButton(type: .boots)
    public let buttonShorts = MBCategoriesButton(type: .shorts)
    public let buttonTapes = MBCategoriesButton(type: .tapes)

    public override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        
        addSubviews([buttonGloves, buttonBoots, buttonShorts, buttonTapes])

        buttonGloves.backgroundColor = .systemGray3
        buttonBoots.backgroundColor = .systemGray3
        buttonShorts.backgroundColor = .systemGray3
        buttonTapes.backgroundColor = .systemGray3

        NSLayoutConstraint.activate([
            buttonGloves.topAnchor.constraint(equalTo: topAnchor),
            buttonGloves.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            buttonBoots.topAnchor.constraint(equalTo: topAnchor),
            buttonBoots.leadingAnchor.constraint(equalTo: buttonGloves.trailingAnchor, constant: 11),

            buttonShorts.topAnchor.constraint(equalTo: topAnchor),
            buttonShorts.leadingAnchor.constraint(equalTo: buttonBoots.trailingAnchor, constant: 11),

            buttonTapes.topAnchor.constraint(equalTo: topAnchor),
            buttonTapes.leadingAnchor.constraint(equalTo: buttonShorts.trailingAnchor, constant: 11),
        ])
        translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  MBShopMenu.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 13/10/2022.
//

import UIKit

class MBShopMenu: UIView {
    
    let buttonGloves = MBCategoriesButton(type: .gloves)
    let buttonBoots = MBCategoriesButton(type: .boots)
    let buttonShorts = MBCategoriesButton(type: .shorts)
    let buttonTapes = MBCategoriesButton(type: .tapes)
    
    var updateCategoryDelegate: UpdateCategoryDelegate? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configure()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func glovesTapped() {
        updateCategoryDelegate?.updateCategory(to: .gloves)
    }
    
    @objc func bootsTapped() {
        updateCategoryDelegate?.updateCategory(to: .boots)
    }
    
    @objc func shortsTapped() {
        updateCategoryDelegate?.updateCategory(to: .shorts)
    }
    
    @objc func tapesTapped() {
        updateCategoryDelegate?.updateCategory(to: .tapes)
    }
    
    private func configureButtons() {
        buttonGloves.addTarget(self, action: #selector(glovesTapped), for: .touchUpInside)
        buttonBoots.addTarget(self, action: #selector(bootsTapped), for: .touchUpInside)
        buttonShorts.addTarget(self, action: #selector(shortsTapped), for: .touchUpInside)
        buttonTapes.addTarget(self, action: #selector(tapesTapped), for: .touchUpInside)
    }
    
    private func configure() {
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

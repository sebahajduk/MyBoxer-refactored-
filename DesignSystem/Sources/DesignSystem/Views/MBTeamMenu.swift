//
//  MBTeamMenu.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 16/10/2022.
//

import UIKit

@available(iOS 16.0, *)
public class MBTeamMenu: UIView {

    public let managerButton = MBCategoriesButton(type: .manager)
    public let coachButton = MBCategoriesButton(type: .coach)
    public let cutmanButton = MBCategoriesButton(type: .cutman)
    public let physioButton = MBCategoriesButton(type: .physio)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews([managerButton, coachButton, cutmanButton, physioButton])
        
        managerButton.backgroundColor = .systemGray3
        coachButton.backgroundColor = .systemGray3
        cutmanButton.backgroundColor = .systemGray3
        physioButton.backgroundColor = .systemGray3
        
        NSLayoutConstraint.activate([
            managerButton.topAnchor.constraint(equalTo: topAnchor),
            managerButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            coachButton.topAnchor.constraint(equalTo: topAnchor),
            coachButton.leadingAnchor.constraint(equalTo: managerButton.trailingAnchor, constant: 11),

            cutmanButton.topAnchor.constraint(equalTo: topAnchor),
            cutmanButton.leadingAnchor.constraint(equalTo: coachButton.trailingAnchor, constant: 11),

            physioButton.topAnchor.constraint(equalTo: topAnchor),
            physioButton.leadingAnchor.constraint(equalTo: cutmanButton.trailingAnchor, constant: 11),
        ])
    }
}

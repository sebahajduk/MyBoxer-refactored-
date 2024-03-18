//
//  MBTeamMenu.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 16/10/2022.
//

import UIKit

class MBTeamMenu: UIView {

    let managerButton = MBCategoriesButton(type: .manager)
    let coachButton = MBCategoriesButton(type: .coach)
    let cutmanButton = MBCategoriesButton(type: .cutman)
    let physioButton = MBCategoriesButton(type: .physio)
    
    var updateTeamHireAgencyDelegate: UpdateTeamHireAgency? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func managerButtonTapped() {
        updateTeamHireAgencyDelegate?.updateTeamHireAgency(to: .manager)
    }
    
    @objc func coachButtonTapped() {
        updateTeamHireAgencyDelegate?.updateTeamHireAgency(to: .coach)
    }
    
    @objc func cutmanButtonTapped() {
        updateTeamHireAgencyDelegate?.updateTeamHireAgency(to: .cutman)
    }
    
    @objc func physioButtonTapped() {
        updateTeamHireAgencyDelegate?.updateTeamHireAgency(to: .physio)
    }
    
    private func configureButtons() {
        managerButton.addTarget(self, action: #selector(managerButtonTapped), for: .touchUpInside)
        coachButton.addTarget(self, action: #selector(coachButtonTapped), for: .touchUpInside)
        cutmanButton.addTarget(self, action: #selector(cutmanButtonTapped), for: .touchUpInside)
        physioButton.addTarget(self, action: #selector(physioButtonTapped), for: .touchUpInside)
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
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

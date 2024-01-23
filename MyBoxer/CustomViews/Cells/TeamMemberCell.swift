//
//  TeamMemberCell.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/10/2022.
//

import UIKit
import DesignSystem

class TeamMemberCell: UITableViewCell {
    
    static let reuseID = "TeamMemberCell"
    
    let memberImage = MBImageView(frame: .zero)
    let memberName = MBLabel(size: 16)
    let memberStat = MBLabel(size: 16, color: .systemGray2)
    let memberPrice = MBLabel(size: 16, color: .systemYellow)
    
    let coin = UIImageView(image: Images.coin)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(for member: Member) {
        memberImage.image = member.image
        memberName.text = member.name
        memberPrice.text = "\(member.price)"
        
        switch member.type {
        case .manager:
            memberStat.text = "+\(member.stats)% money per fight"
        case .coach:
            memberStat.text = "+\(member.stats)% training effect"
        case .cutman:
            memberStat.text = "+\(member.stats)% regeneration during fight"
        case .physio:
            memberStat.text = "+\(member.stats)% home regeneration"
        }
    }
    
    private func configure() {
        addSubviews([memberImage, memberName, memberStat, memberPrice, coin])
        
        coin.translatesAutoresizingMaskIntoConstraints = false
        
        coin.tintColor = .systemYellow
        
        NSLayoutConstraint.activate([
            memberImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            memberImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            memberImage.widthAnchor.constraint(equalToConstant: 80),
            memberImage.heightAnchor.constraint(equalToConstant: 80),
            
            memberName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            memberName.leadingAnchor.constraint(equalTo: memberImage.trailingAnchor, constant: 20),
            memberName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            memberName.heightAnchor.constraint(equalToConstant: 20),
            
            memberStat.topAnchor.constraint(equalTo: memberName.bottomAnchor, constant: 10),
            memberStat.leadingAnchor.constraint(equalTo: memberImage.trailingAnchor, constant: 20),
            memberStat.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            memberStat.heightAnchor.constraint(equalToConstant: 30),
            
            coin.topAnchor.constraint(equalTo: memberPrice.topAnchor, constant: -1),
            coin.leadingAnchor.constraint(equalTo: memberImage.trailingAnchor, constant: 20),
            coin.heightAnchor.constraint(equalToConstant: 15),
            coin.widthAnchor.constraint(equalToConstant: 15),
            
            memberPrice.heightAnchor.constraint(equalToConstant: 16),
            memberPrice.leadingAnchor.constraint(equalTo: coin.trailingAnchor, constant: 2),
            memberPrice.widthAnchor.constraint(equalToConstant: 150),
            memberPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    
    
}

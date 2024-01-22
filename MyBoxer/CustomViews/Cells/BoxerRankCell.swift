//
//  BoxerRankCell.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/10/2022.
//

import UIKit

class BoxerRankCell: UICollectionViewCell {
    
    static let reuseID = "BoxerRankCell"
    
    let boxerImage = MBImageView(frame: .zero)
    let boxerName = MBLabel(size: 16)
    let boxerRecord = MBLabel(size: 16)
    let boxerRank = MBLabel(size: 16)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(for boxer: Boxer, rank: Int) {
        if boxer is Opponent {
            boxerImage.image = Images.opponent
        } else if boxer is Player {
            boxerImage.image = Images.player
        }

        boxerName.text = boxer.name

        let wins = boxer.record["Wins"] ?? 0
        let draws = boxer.record["Draws"] ?? 0
        let losses = boxer.record["Losses"] ?? 0

        boxerRecord.text = "\(wins)/\(draws)/\(losses)"

        boxerRank.text = "\(rank)"
        
        switch rank {
        case 0:
            boxerRank.textColor = .systemMint
            boxerRank.text = "CHAMP"
        case 1:
            boxerRank.textColor = .systemYellow
        case 2:
            boxerRank.textColor = .systemGray3
        case 3:
            boxerRank.textColor = .systemBrown
        default:
            boxerRank.textColor = .label
        }
    }
    
    private func configure() {
        addSubviews([boxerImage, boxerRank, boxerName, boxerRecord])
        
        boxerName.translatesAutoresizingMaskIntoConstraints = false
        boxerRecord.translatesAutoresizingMaskIntoConstraints = false
        boxerRank.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            boxerImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            boxerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            boxerImage.widthAnchor.constraint(equalToConstant: 80),
            boxerImage.heightAnchor.constraint(equalToConstant: 80),
            
            boxerRank.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            boxerRank.leadingAnchor.constraint(equalTo: boxerImage.trailingAnchor, constant: 10),
            boxerRank.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            boxerRank.heightAnchor.constraint(equalToConstant: 20),
            
            boxerName.topAnchor.constraint(equalTo: boxerRank.bottomAnchor, constant: 5),
            boxerName.leadingAnchor.constraint(equalTo: boxerImage.trailingAnchor, constant: 10),
            boxerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            boxerName.heightAnchor.constraint(equalToConstant: 30),
            
            boxerRecord.heightAnchor.constraint(equalToConstant: 16),
            boxerRecord.leadingAnchor.constraint(equalTo: boxerImage.trailingAnchor, constant: 10),
            boxerRecord.widthAnchor.constraint(equalToConstant: 150),
            boxerRecord.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

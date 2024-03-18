//
//  FightingCell.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 29/09/2022.
//

import UIKit
import DesignSystem

class OpponentCell: UITableViewCell {
    
    static let reuseID = "OpponentCell"
    
    let vitLabel = MBLabel(size: 16, color: .systemGray2)
    
    let opponentImage = MBImageView(frame: .zero)
    let opponentName = MBLabel(size: 16)
    var statView = StatView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(for opponent: Opponent, index: Int) {
        opponentImage.image = Images.opponent
        opponentName.text = opponent.name
        statView.set(boxer: opponent)
    }
    
    private func configure() {
        addSubviews([opponentImage, opponentName, statView])
                
        NSLayoutConstraint.activate([
            opponentImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            opponentImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            opponentImage.heightAnchor.constraint(equalToConstant: 160),
            opponentImage.widthAnchor.constraint(equalToConstant: 160),
            
            opponentName.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 10),
            opponentName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            opponentName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            opponentName.heightAnchor.constraint(equalToConstant: 18),
            
            statView.topAnchor.constraint(equalTo: opponentName.bottomAnchor, constant: 18),
            statView.heightAnchor.constraint(equalToConstant: 140),
            statView.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 10),
            statView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}

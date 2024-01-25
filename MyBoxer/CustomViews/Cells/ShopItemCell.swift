//
//  ShopItemCell.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 10/10/2022.
//

import UIKit
import DesignSystem

class ShopItemCell: UITableViewCell {
    
    static let reuseID = "ShopItemCell"
    
    let itemName = MBLabel(size: 16)
    let itemStats = MBLabel(size: 16, color: .systemGray2)
    let itemImage = MBImageView(frame: .zero)
    let itemPrice = MBLabel(size: 16, color: .systemYellow)
    let coin = UIImageView(image: Images.coin)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(item: Item) {
        itemName.text = item.name
        itemPrice.text = "\(item.cost)"
        itemImage.image = item.image
        itemImage.layer.magnificationFilter = CALayerContentsFilter.nearest
        itemImage.layer.shouldRasterize = true

        switch item.type {
        case .gloves:
            itemStats.text = "Punch power +\(item.stats)"
        case .boots:
            itemStats.text = "Footwork +\(item.stats)"
        case .shorts:
            itemStats.text = "Movement +\(item.stats)"
        case .tapes:
            itemStats.text = "Punch speed +\(item.stats)"
        }
    }
    
    private func configure() {
        addSubviews([itemName, itemStats, itemImage, itemPrice, coin])
        
        coin.translatesAutoresizingMaskIntoConstraints = false
        
        coin.tintColor = .systemYellow
        
        NSLayoutConstraint.activate([
            itemImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            itemImage.widthAnchor.constraint(equalToConstant: 80),
            itemImage.heightAnchor.constraint(equalToConstant: 80),
            
            itemName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            itemName.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
            itemName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            itemName.heightAnchor.constraint(equalToConstant: 20),
            
            itemStats.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 10),
            itemStats.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
            itemStats.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            itemStats.heightAnchor.constraint(equalToConstant: 30),
            
            coin.topAnchor.constraint(equalTo: itemPrice.topAnchor, constant: -1),
            coin.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
            coin.heightAnchor.constraint(equalToConstant: 15),
            coin.widthAnchor.constraint(equalToConstant: 15),
            
            itemPrice.heightAnchor.constraint(equalToConstant: 16),
            itemPrice.leadingAnchor.constraint(equalTo: coin.trailingAnchor, constant: 2),
            itemPrice.widthAnchor.constraint(equalToConstant: 150),
            itemPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

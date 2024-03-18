//
//  ShopView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/01/2024.
//

import UIKit
import DesignSystem

class ShopView: UIView {
    
    private(set) var menu = MBShopMenu(frame: .zero)
    private(set) var tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ShopView {
    func setupView() {
        backgroundColor = .systemBackground

        addSubviews([menu, tableView])

        tableView.register(ShopItemCell.self, forCellReuseIdentifier: ShopItemCell.reuseID)
        tableView.rowHeight = 100

        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            menu.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            menu.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            menu.heightAnchor.constraint(equalToConstant: 30),

            tableView.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

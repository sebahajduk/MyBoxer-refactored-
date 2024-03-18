//
//  OpponentsView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 17/01/2024.
//

import UIKit

final class OpponentsView: UIView {

    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        addSubviews([tableView])

        tableView.register(OpponentCell.self, forCellReuseIdentifier: OpponentCell.reuseID)
        tableView.rowHeight = 202

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

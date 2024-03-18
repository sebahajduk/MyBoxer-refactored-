//
//  TrainingView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/01/2024.
//

import UIKit

final class TrainingView: UIView {

    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TrainingView {
    func setupTableView() {
        addSubviews([tableView])
        tableView.register(TrainingCell.self, forCellReuseIdentifier: TrainingCell.reuseID)
        tableView.rowHeight = 100

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

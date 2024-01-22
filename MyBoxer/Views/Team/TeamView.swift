//
//  TeamView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/01/2024.
//

import UIKit

final class TeamView: UIView {
    
    let menu = MBTeamMenu(frame: .zero)
    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TeamView {
    func updateTableView() {
        UIView.transition(
            with: tableView,
            duration: 0.35,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                guard let self else { return }
                self.tableView.reloadData()
            }
        )
    }
}

private extension TeamView {
    func setupView() {
        backgroundColor = .systemBackground

        addSubviews([menu, tableView])
        
        tableView.register(TeamMemberCell.self, forCellReuseIdentifier: TeamMemberCell.reuseID)
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

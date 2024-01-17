//
//  TeamVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 16/10/2022.
//

import UIKit

protocol UpdateTeamHireAgency: AnyObject {
    func updateTeamHireAgency(to specialization: MemberType)
}

class TeamVC: UIViewController, UpdateTeamHireAgency {
    
    var player: Player!
    
    let menu = MBTeamMenu(frame: .zero)
    let tableView = UITableView()
    
    var memberType: MemberType = .manager
    
    let managers: [Member] = [
        Member(name: "Horace Hines", stats: 2, price: 300, type: .manager),
        Member(name: "Shawn Bennett", stats: 5, price: 800, type: .manager),
        Member(name: "Halbert Rowse", stats: 7, price: 1200, type: .manager),
        Member(name: "Jack Swanson", stats: 10, price: 2000, type: .manager),
        Member(name: "Herman Nichols", stats: 15, price: 3500, type: .manager)
    ]
    
    let coaches: [Member] = [
        Member(name: "Dane Lawrence", stats: 2, price: 300, type: .coach),
        Member(name: "Ryan Pierpoint", stats: 5, price: 800, type: .coach),
        Member(name: "Ray Warner", stats: 7, price: 1200, type: .coach),
        Member(name: "Tristan Buckley", stats: 10, price: 2000, type: .coach),
        Member(name: "Cecil Wolfe", stats: 15, price: 3500, type: .coach)
    ]
    
    let cutmans: [Member] = [
        Member(name: "Davy Mendoza", stats: 2, price: 300, type: .cutman),
        Member(name: "Hanley Chasey", stats: 5, price: 800, type: .cutman),
        Member(name: "Frederick Lucas", stats: 7, price: 1200, type: .cutman),
        Member(name: "Russ Steele", stats: 10, price: 2000, type: .cutman),
        Member(name: "Marsh Carr", stats: 15, price: 3500, type: .cutman)
    ]
    
    let physios: [Member] = [
        Member(name: "Jerry Bates", stats: 2, price: 300, type: .physio),
        Member(name: "Justin Hodgson", stats: 5, price: 800, type: .physio),
        Member(name: "Sylvester Harris", stats: 7, price: 1200, type: .physio),
        Member(name: "Franklin Olson", stats: 10, price: 2000, type: .physio),
        Member(name: "Errol Floyd", stats: 15, price: 3500, type: .physio)
    ]
    
    convenience init(player: Player) {
        self.init()
        
        self.player = player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configure()
    }
    
    private func configure() {
        view.addSubviews([menu, tableView])
        menu.updateTeamHireAgencyDelegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TeamMemberCell.self, forCellReuseIdentifier: TeamMemberCell.reuseID)
        tableView.rowHeight = 100
        
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menu.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func updateTeamHireAgency(to specialization: MemberType) {
        self.memberType = specialization
        
        UIView.transition(with: tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { () -> Void in
            self.tableView.reloadData()
        })
    }
}

extension TeamVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamMemberCell.reuseID) as! TeamMemberCell
        
        switch memberType {
        case .manager:
            cell.set(for: managers[indexPath.row])
        case .coach:
            cell.set(for: coaches[indexPath.row])
        case .cutman:
            cell.set(for: cutmans[indexPath.row])
        case .physio:
            cell.set(for: physios[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var member: Member
        
        switch memberType {
        case .manager:
            member = managers[indexPath.row]
        case .coach:
            member = coaches[indexPath.row]
        case .cutman:
            member = cutmans[indexPath.row]
        case .physio:
            member = physios[indexPath.row]
        }
        tableView.deselectRow(at: indexPath, animated: true)
        player.hire(member: member)
    }
}

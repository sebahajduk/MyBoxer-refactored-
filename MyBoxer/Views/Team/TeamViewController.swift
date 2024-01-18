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

class TeamViewController: UIViewController, UpdateTeamHireAgency {

    private var teamView = TeamView()
    private var teamRepository = TeamRepository()

    var player: Player!
    var memberType: MemberType = .manager
    
    convenience init(player: Player) {
        self.init()
        
        self.player = player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teamView.menu.updateTeamHireAgencyDelegate = self
        setupView()
    }
    
    private func setupView() {
        view = teamView
        teamView.tableView.delegate = self
        teamView.tableView.dataSource = self
    }
    
    func updateTeamHireAgency(to specialization: MemberType) {
        self.memberType = specialization
        
        teamView.updateTableView()
    }
}

extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamMemberCell.reuseID) as! TeamMemberCell
        
        switch memberType {
        case .manager:
            cell.set(for: teamRepository.managers[indexPath.row])
        case .coach:
            cell.set(for: teamRepository.coaches[indexPath.row])
        case .cutman:
            cell.set(for: teamRepository.cutmans[indexPath.row])
        case .physio:
            cell.set(for: teamRepository.physios[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var member: Member
        
        switch memberType {
        case .manager:
            member = teamRepository.managers[indexPath.row]
        case .coach:
            member = teamRepository.coaches[indexPath.row]
        case .cutman:
            member = teamRepository.cutmans[indexPath.row]
        case .physio:
            member = teamRepository.physios[indexPath.row]
        }
        tableView.deselectRow(at: indexPath, animated: true)
        player.hire(member: member)
    }
}

//
//  TeamVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 16/10/2022.
//

import UIKit

final class TeamViewController: UIViewController {
    var presenter: ViewToPresenterTeamCommunicator?

    private var teamView = TeamView()

    private var memberType: MemberType = .manager
    
    private var hiredMembersNames = [String]() {
        didSet {
            reloadMembersList()
        }
    }

    private var membersList = [Member]() {
        didSet {
            reloadMembersList()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewLoaded()
        setupView()
    }
}

private extension TeamViewController {
    func setupView() {
        view = teamView
        teamView.tableView.delegate = self
        teamView.tableView.dataSource = self

        let teamViewMenu = teamView.menu

        teamViewMenu.managerButton.addAction(updateTeamHireAgency(to: .manager), for: .touchUpInside)
        teamViewMenu.coachButton.addAction(updateTeamHireAgency(to: .coach), for: .touchUpInside)
        teamViewMenu.cutmanButton.addAction(updateTeamHireAgency(to: .cutman), for: .touchUpInside)
        teamViewMenu.physioButton.addAction(updateTeamHireAgency(to: .physio), for: .touchUpInside)
    }

    func reloadMembersList() {
        teamView.tableView.reloadData()
    }

    func updateTeamHireAgency(to specialization: MemberType) -> UIAction {
        UIAction { [weak self] _ in
            self?.memberType = specialization

            self?.presenter?.categoryButtonTapped(category: specialization)
        }
    }
}

extension TeamViewController: PresenterToViewTeamCommunicator {
    func updateMembersOffer(to members: [Member], hiredMembers: [String]) {
        membersList = members
        self.hiredMembersNames = hiredMembers
    }
    
    func showAlert(_ type: AlertType) {
        let alert = AlertViewController(alertType: type)

        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve

        navigationController?.present(alert, animated: true)
    }
    
    func dismiss() {
        navigationController?.popViewController(animated: true)
    }
}

extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return membersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: TeamMemberCell.reuseID) as? TeamMemberCell
        else { return UITableViewCell() }
        
        let member = membersList[indexPath.row]

        cell.set(for: member)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = membersList[indexPath.row]

        tableView.deselectRow(at: indexPath, animated: true)

        presenter?.didSelect(member: member)
    }
}

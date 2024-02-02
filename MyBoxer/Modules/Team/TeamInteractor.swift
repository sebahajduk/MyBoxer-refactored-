//
//  TeamInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/02/2024.
//

import Foundation

final class TeamInteractor {
    weak var presenter: InteractorToPresenterTeamProtocol?
}

extension TeamInteractor: PresenterToInteractorTeamProtocol {
    func membersTypeChanged(to type: MemberType) {
        var members = [Member]()

        switch type {
        case .manager:
            members = TeamRepository.managers
        case .coach:
            members = TeamRepository.coaches
        case .cutman:
            members = TeamRepository.cutmans
        case .physio:
            members = TeamRepository.physios
        }

        presenter?.onSucceededNewMembersList(members)
    }
    
    func setupData() {
        let members = TeamRepository.managers

        presenter?.setupMembers(members)
    }
    
    func hire(member: Member, player: Player) {
        if player.money < member.price {
            presenter?.onFailureHiring(reason: .notEnoughMoney)
        } else if player.team.contains(where: { $0 == member.name }) {
            presenter?.onFailureHiring(reason: .alreadyBought)
        } else {
            player.hire(member: member)
            presenter?.onSucceededHiring()
        }
    }
}

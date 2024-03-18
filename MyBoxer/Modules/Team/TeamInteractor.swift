//
//  TeamInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/02/2024.
//

import Foundation

final class TeamInteractor {
    weak var presenter: InteractorToPresenterTeamCommunicator?

    private var player: Player
    private var database: RealmRepositorable

    init(database: RealmRepositorable) {
        self.database = database
        player = database.getPlayer()
    }
}

extension TeamInteractor: PresenterToInteractorTeamCommunicator {
    func membersTypeChanged(to type: MemberType) {
        var members = [Member]()
        var hiredMembers = [String]()

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

        player.team.forEach { hiredMembers.append($0) }

        presenter?.onSucceededNewMembersList(members, hiredMembers: hiredMembers)
    }
    
    func setupData() {
        let members = TeamRepository.managers
        var hiredMembers = [String]()

        player.team.forEach { hiredMembers.append($0) }

        presenter?.setupMembers(members, hiredMembers: hiredMembers)
    }
    
    func hire(member: Member) {
        if player.money < member.price {
            presenter?.onFailureHiring(reason: .notEnoughMoney)
        } else if player.team.contains(where: { $0 == member.name }) {
            presenter?.onFailureHiring(reason: .alreadyBought)
        } else {
            database.savePlayer {
                player.hire(member: member)
            }

            presenter?.onSucceededHiring()
        }
    }
}

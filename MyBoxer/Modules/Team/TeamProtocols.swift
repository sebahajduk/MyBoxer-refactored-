//
//  TeamCommunicators.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/02/2024.
//

import Foundation

protocol ViewToPresenterTeamCommunicator {
    func categoryButtonTapped(category: MemberType)
    func viewLoaded()
    func didSelect(member: Member, player: Player)
}

protocol InteractorToPresenterTeamCommunicator: AnyObject {
    func setupMembers(_ members: [Member])
    func onSucceededNewMembersList(_ members: [Member])

    func onSucceededHiring()
    func onFailureHiring(reason: AlertType)
}

protocol PresenterToViewTeamCommunicator: AnyObject {
    func updateMembersOffer(to members: [Member])
    func showAlert(_ type: AlertType)
    func dismiss()
}

protocol PresenterToInteractorTeamCommunicator {
    func membersTypeChanged(to type: MemberType)
    func setupData()
    func hire(member: Member, player: Player)
}

protocol PresenterToRouterTeamCommunicator {

}

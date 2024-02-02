//
//  TeamProtocols.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/02/2024.
//

import Foundation

protocol ViewToPresenterTeamProtocol {
    func categoryButtonTapped(category: MemberType)
    func viewLoaded()
    func didSelect(member: Member, player: Player)
}

protocol InteractorToPresenterTeamProtocol: AnyObject {
    func setupMembers(_ members: [Member])
    func onSucceededNewMembersList(_ members: [Member])

    func onSucceededHiring()
    func onFailureHiring(reason: AlertType)
}

protocol PresenterToViewTeamProtocol: AnyObject {
    func updateMembersOffer(to members: [Member])
    func showAlert(_ type: AlertType)
    func dismiss()
}

protocol PresenterToInteractorTeamProtocol {
    func membersTypeChanged(to type: MemberType)
    func setupData()
    func hire(member: Member, player: Player)
}

protocol PresenterToRouterTeamProtocol {

}

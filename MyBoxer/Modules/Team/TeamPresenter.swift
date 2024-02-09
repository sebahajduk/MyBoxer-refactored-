//
//  TeamPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/02/2024.
//

import Foundation

final class TeamPresenter {
    weak var view: PresenterToViewTeamCommunicator?
    var interactor: PresenterToInteractorTeamCommunicator?
    var router: PresenterToRouterTeamCommunicator?
}

extension TeamPresenter: ViewToPresenterTeamCommunicator {
    func categoryButtonTapped(category: MemberType) {
        interactor?.membersTypeChanged(to: category)
    }
    
    func viewLoaded() {
        interactor?.setupData()
    }
    
    func didSelect(member: Member) {
        interactor?.hire(member: member)
    }
}

extension TeamPresenter: InteractorToPresenterTeamCommunicator {
    func setupMembers(_ members: [Member], hiredMembers: [String]) {
        view?.updateMembersOffer(to: members, hiredMembers: hiredMembers)
    }
    
    func onSucceededNewMembersList(_ members: [Member], hiredMembers: [String]) {
        view?.updateMembersOffer(to: members, hiredMembers: hiredMembers)
    }
    
    func onSucceededHiring() {
        view?.dismiss()
    }

    func onFailureHiring(reason: AlertType) {
        view?.showAlert(reason)
    }
}

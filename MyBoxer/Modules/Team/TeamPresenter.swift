//
//  TeamPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/02/2024.
//

import Foundation

final class TeamPresenter {
    weak var view: PresenterToViewTeamProtocol?
    var interactor: PresenterToInteractorTeamProtocol?
    var router: PresenterToRouterTeamProtocol?
}

extension TeamPresenter: ViewToPresenterTeamProtocol {
    func categoryButtonTapped(category: MemberType) {
        interactor?.membersTypeChanged(to: category)
    }
    
    func viewLoaded() {
        interactor?.setupData()
    }
    
    func didSelect(member: Member, player: Player) {
        interactor?.hire(member: member, player: player)
    }
}

extension TeamPresenter: InteractorToPresenterTeamProtocol {
    func setupMembers(_ members: [Member]) {
        view?.updateMembersOffer(to: members)
    }
    
    func onSucceededNewMembersList(_ members: [Member]) {
        view?.updateMembersOffer(to: members)
    }
    
    func onSucceededHiring() {
        view?.dismiss()
    }

    func onFailureHiring(reason: AlertType) {
        view?.showAlert(reason)
    }
}
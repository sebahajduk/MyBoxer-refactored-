//
//  ShopPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class ShopPresenter {
    weak var view: PresenterToViewShopCommunicator?
    var interactor: PresenterToInteractorShopCommunicator?
    var router: PresenterToRouterShopCommunicator?
}

extension ShopPresenter: ViewToPresenterShopCommunicator {
    func didSelect(item: Item) {
        interactor?.buy(item: item)
    }
    
    func viewLoaded() {
        interactor?.setupData()
    }
    
    func categoryButtonTapped(category: ItemType) {
        interactor?.itemsTypeChanged(to: category)
    }
}

extension ShopPresenter: InteractorToPresenterShopCommunicator {
    func onSucceededBuying() {
        view?.dismiss()
    }
    
    func onFailureBuying(reason: AlertType) {
        view?.showAlert(reason)
    }
    
    func onSucceededNewShopOffer(_ items: [Item], ownedItemsID: [Int]) {
        view?.updateShopOffer(with: items, ownedItemsID: ownedItemsID)
    }
    
    func sendItemsForNewType(_ items: [Item], ownedItemsID: [Int]) {
        view?.updateShopOffer(with: items, ownedItemsID: ownedItemsID)
    }
}

//
//  ShopPresenter.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class ShopPresenter {
    weak var view: PresenterToViewShopProtocol?
    var interactor: PresenterToInteractorShopProtocol?
    var router: PresenterToRouterShopProtocol?
}

extension ShopPresenter: ViewToPresenterShopProtocol {
    func didSelect(item: Item, player: Player) {
        interactor?.buy(item: item, player: player)
    }
    
    func viewLoaded() {
        interactor?.setupData()
    }
    
    func categoryButtonTapped(category: ItemType) {
        interactor?.itemsTypeChanged(to: category)
    }
}

extension ShopPresenter: InteractorToPresenterShopProtocol {
    func onSucceededBuying() {
        view?.dismiss()
    }
    
    func onFailureBuying(reason: AlertType) {
        view?.showAlert(reason)
    }
    
    func onSucceededNewShopOffer(_ items: [Item]) {
        view?.updateShopOffer(with: items)
    }
    
    func sendItemsForNewType(_ items: [Item]) {
        view?.updateShopOffer(with: items)
    }
}

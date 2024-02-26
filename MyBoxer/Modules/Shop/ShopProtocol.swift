//
//  ShopCommunicator.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

protocol ViewToPresenterShopCommunicator {
    func categoryButtonTapped(category: ItemType)
    func viewLoaded()
    func didSelect(item: Item)
}

protocol InteractorToPresenterShopCommunicator: AnyObject {
    func sendItemsForNewType(_ items: [Item], ownedItemsID: [Int])
    func onSucceededNewShopOffer(_ items: [Item], ownedItemsID: [Int])

    func onSucceededBuying()
    func onFailureBuying(reason: AlertType)
}

protocol PresenterToViewShopCommunicator: AnyObject {
    func updateShopOffer(with items: [Item], ownedItemsID: [Int])
    func showAlert(_ type: AlertType)
    func dismiss()
}

protocol PresenterToInteractorShopCommunicator {
    func itemsTypeChanged(to type: ItemType)
    func setupData()
    func buy(item: Item)
}

protocol PresenterToRouterShopCommunicator {

}

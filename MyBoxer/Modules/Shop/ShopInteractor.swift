//
//  ShopInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class ShopInteractor {
    weak var presenter: InteractorToPresenterShopCommunicator?
}

extension ShopInteractor: PresenterToInteractorShopCommunicator {
    func buy(item: Item, player: Player) {
        if player.money < item.cost {
            presenter?.onFailureBuying(reason: .notEnoughMoney)
        } else if player.equipment.contains(where: { $0 == item.id }) {
            presenter?.onFailureBuying(reason: .alreadyBought)
        } else {
            player.buyItem(item)
            presenter?.onSucceededBuying()
        }
    }
    
    func setupData() {
        let items = ItemsRepository.gloves

        presenter?.onSucceededNewShopOffer(items)
    }
    
    func itemsTypeChanged(to type: ItemType) {
        var items = [Item]()

        switch type {
        case .gloves:
            items = ItemsRepository.gloves
        case .boots:
            items = ItemsRepository.boots
        case .shorts:
            items = ItemsRepository.shorts
        case .tapes:
            items = ItemsRepository.tapes
        }

        presenter?.sendItemsForNewType(items)
    }
}

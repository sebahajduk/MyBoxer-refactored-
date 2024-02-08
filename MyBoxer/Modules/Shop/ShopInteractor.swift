//
//  ShopInteractor.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 30/01/2024.
//

import Foundation

final class ShopInteractor {
    weak var presenter: InteractorToPresenterShopCommunicator?

    private var player: Player
    private var database: RealmRepositorable

    init(database: RealmRepositorable) {
        self.database = database
        player = database.getPlayer()
    }
}

extension ShopInteractor: PresenterToInteractorShopCommunicator {
    func buy(item: Item) {
        if player.money < item.cost {
            presenter?.onFailureBuying(reason: .notEnoughMoney)
        } else if player.equipment.contains(where: { $0 == item.id }) {
            presenter?.onFailureBuying(reason: .alreadyBought)
        } else {
            database.savePlayer {
                player.buyItem(item)
            }

            presenter?.onSucceededBuying()
        }
    }
    
    func setupData() {
        let items = ItemsRepository.gloves
        var ownedItemsID = [Int]()

        player.equipment.forEach { ownedItemsID.append($0) }

        presenter?.onSucceededNewShopOffer(items, ownedItemsID: ownedItemsID)
    }
    
    func itemsTypeChanged(to type: ItemType) {
        var items = [Item]()
        var ownedItemsID = [Int]()

        player.equipment.forEach { ownedItemsID.append($0) }

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

        presenter?.sendItemsForNewType(items, ownedItemsID: ownedItemsID)
    }
}

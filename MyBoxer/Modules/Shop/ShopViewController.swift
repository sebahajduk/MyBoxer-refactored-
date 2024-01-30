//
//  ShopVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 10/10/2022.
//

import UIKit
import DesignSystem

final class ShopViewController: UIViewController {
    private var shopView = ShopView()
    
    private var player: Player!
    private let itemsRepository = ItemsRepository()

    var type: ItemType = .gloves

    convenience init(player: Player) {
        self.init()
        
        self.player = player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupShopView()
    }
}

private extension ShopViewController {
    func setupShopView() {
        view = shopView
        shopView.tableView.delegate = self
        shopView.tableView.dataSource = self

        let shopViewMenu = shopView.menu

        shopViewMenu.buttonGloves.addAction(updateCategory(to: .gloves), for: .touchUpInside)
        shopViewMenu.buttonBoots.addAction(updateCategory(to: .boots), for: .touchUpInside)
        shopViewMenu.buttonShorts.addAction(updateCategory(to: .shorts), for: .touchUpInside)
        shopViewMenu.buttonTapes.addAction(updateCategory(to: .tapes), for: .touchUpInside)
    }

    func updateCategory(to type: ItemType) -> UIAction {
        UIAction { [weak self] _ in
            self?.type = type

            self?.shopView.updateTableView()
        }
    }
}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ShopItemCell.reuseID) as? ShopItemCell
        else { return UITableViewCell() }

        var item: Item
        
        switch type {
        case .gloves:
            item = itemsRepository.gloves[indexPath.row]
            cell.set(item: item)
        case .boots:
            item = itemsRepository.boots[indexPath.row]
            cell.set(item: item)
        case .shorts:
            item = itemsRepository.shorts[indexPath.row]
            cell.set(item: item)
        case .tapes:
            item = itemsRepository.tapes[indexPath.row]
            cell.set(item: item)
        }
        
        if player.equipment.contains(where: { $0 == item.id }) {
            cell.backgroundColor = .systemGreen.withAlphaComponent(0.2)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var item: Item
        
        switch type {
        case .gloves:
            item = itemsRepository.gloves[indexPath.row]
        case .boots:
            item = itemsRepository.boots[indexPath.row]
        case .shorts:
            item = itemsRepository.shorts[indexPath.row]
        case .tapes:
            item = itemsRepository.tapes[indexPath.row]
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if player.money < item.cost {
            let alert = AlertViewController(alertType: .notEnoughMoney)

            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
            return
        } else if player.equipment.contains(where: { $0 == item.id }) {
            let alert = AlertViewController(alertType: .notEnoughMoney)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
            return
        }
        
        shopView.updateTableView()

        player.buyItem(item)
    }
}

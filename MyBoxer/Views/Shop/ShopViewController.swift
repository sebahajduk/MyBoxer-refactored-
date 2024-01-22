//
//  ShopVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 10/10/2022.
//

import UIKit

protocol UpdateCategoryDelegate: AnyObject {
    func updateCategory(to category: ItemType)
}

class ShopViewController: UIViewController {
    private var shopView = ShopView()
    
    private var player: Player!
    let itemCategories: [String] = ["Gloves", "Boots", "Shorts", "Wraps"]
    private let itemsRepository = ItemsRepository()

    var type: ItemType = .gloves


    convenience init(player: Player) {
        self.init()
        
        self.player = player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopView.menu.updateCategoryDelegate = self
        setupShopView()
    }

    func setupShopView() {
        view = shopView
        shopView.tableView.delegate = self
        shopView.tableView.dataSource = self
    }
}

extension ShopViewController: UpdateCategoryDelegate {
    func updateCategory(to type: ItemType) {
        self.type = type

        shopView.updateTableView()
    }
}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopItemCell.reuseID) as! ShopItemCell

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
            let alert = AlertViewController(title: "You do not have enough money", message: AlertType.notEnoughMoney)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
            return
        } else if player.equipment.contains(where: { $0 == item.id }) {
            let alert = AlertViewController(title: "You already have this item", message: AlertType.notEnoughMoney)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
            return
        }
        
        shopView.updateTableView()

        player.buyItem(item)
    }
}

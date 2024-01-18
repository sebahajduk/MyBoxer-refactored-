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

class ShopVC: UIViewController, UpdateCategoryDelegate {
    private var shopView = ShopView()
    
    private var player: Player!
    let itemCategories: [String] = ["Gloves", "Boots", "Shorts", "Wraps"]
    var type: ItemType = .gloves
    
    let gloves: [Item] = [
        Item(id: 0, name: "Boxing glove", stats: 3, cost: 15, type: .gloves),
        Item(id: 1, name: "Boxing glove", stats: 5, cost: 25, type: .gloves),
        Item(id: 2, name: "Boxing glove", stats: 7, cost: 40, type: .gloves),
        Item(id: 3, name: "Boxing glove", stats: 11, cost: 60, type: .gloves),
        Item(id: 4, name: "Boxing glove", stats: 13, cost: 90, type: .gloves),
    ]
    
    let boots: [Item] = [
        Item(id: 5, name: "Boxing boots", stats: 3, cost: 15, type: .boots),
        Item(id: 6, name: "Boxing boots", stats: 5, cost: 25, type: .boots),
        Item(id: 7, name: "Boxing boots", stats: 7, cost: 40, type: .boots),
        Item(id: 8, name: "Boxing boots", stats: 11, cost: 60, type: .boots),
        Item(id: 9, name: "Boxing boots", stats: 13, cost: 90, type: .boots),
    ]
    
    let shorts: [Item] = [
        Item(id: 10, name: "Boxing shorts", stats: 3, cost: 15, type: .shorts),
        Item(id: 11, name: "Boxing shorts", stats: 5, cost: 25, type: .shorts),
        Item(id: 12, name: "Boxing shorts", stats: 7, cost: 40, type: .shorts),
        Item(id: 13, name: "Boxing shorts", stats: 11, cost: 60, type: .shorts),
        Item(id: 14, name: "Boxing shorts", stats: 13, cost: 90, type: .shorts),
    ]
    
    let tapes: [Item] = [
        Item(id: 15, name: "Boxing tapes", stats: 3, cost: 15, type: .tapes),
        Item(id: 16, name: "Boxing tapes", stats: 5, cost: 25, type: .tapes),
        Item(id: 17, name: "Boxing tapes", stats: 7, cost: 40, type: .tapes),
        Item(id: 18, name: "Boxing tapes", stats: 11, cost: 60, type: .tapes),
        Item(id: 19, name: "Boxing tapes", stats: 13, cost: 90, type: .tapes),
    ]
    
    convenience init(player: Player) {
        self.init()
        
        self.player = player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopView.menu.updateCategoryDelegate = self
        setupShopView()
    }

    func updateCategory(to type: ItemType) {
        self.type = type
        
        shopView.updateTableView()
    }
    
    func setupShopView() {
        shopView.tableView.delegate = self
        shopView.tableView.dataSource = self
    }
}

extension ShopVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopItemCell.reuseID) as! ShopItemCell

        var item: Item
        
        switch type {
        case .gloves:
            item = gloves[indexPath.row]
            cell.set(item: item)
        case .boots:
            item = boots[indexPath.row]
            cell.set(item: item)
        case .shorts:
            item = shorts[indexPath.row]
            cell.set(item: item)
        case .tapes:
            item = tapes[indexPath.row]
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
            item = gloves[indexPath.row]
        case .boots:
            item = boots[indexPath.row]
        case .shorts:
            item = shorts[indexPath.row]
        case .tapes:
            item = tapes[indexPath.row]
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if player.money < item.cost {
            let alert = AlertVC(title: "You do not have enough money", message: AlertType.notEnoughMoney)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
            return
        } else if player.equipment.contains(where: { $0 == item.id }) {
            let alert = AlertVC(title: "You already have this item", message: AlertType.notEnoughMoney)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
            return
        }
        
        shopView.updateTableView()

        player.buyItem(item)
    }
}

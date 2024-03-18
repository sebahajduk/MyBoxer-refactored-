//
//  ShopVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 10/10/2022.
//

import UIKit
import DesignSystem

final class ShopViewController: UIViewController {
    typealias shopMenuButtonType = ItemType
    var presenter: ViewToPresenterShopCommunicator?

    private var shopView = ShopView()

    private var type: ItemType = .gloves

    private var ownedItemsID = [Int]() {
        didSet {
            reloadTableView()
        }
    }

    private var shopOffer = [Item]() {
        didSet {
            reloadTableView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupShopView()
        presenter?.viewLoaded()
    }
}

private extension ShopViewController {
    func setupShopView() {
        view = shopView
        shopView.tableView.delegate = self
        shopView.tableView.dataSource = self

        let shopViewMenu = shopView.menu

        shopViewMenu.buttonGloves.addAction(menuButtonTapped(.gloves), for: .touchUpInside)
        shopViewMenu.buttonBoots.addAction(menuButtonTapped(.boots), for: .touchUpInside)
        shopViewMenu.buttonShorts.addAction(menuButtonTapped(.shorts), for: .touchUpInside)
        shopViewMenu.buttonTapes.addAction(menuButtonTapped(.tapes), for: .touchUpInside)
    }
    
    func menuButtonTapped(_ type: shopMenuButtonType) -> UIAction {
        UIAction { [weak self] _ in
            guard let self else { return }

            self.type = type
            self.presenter?.categoryButtonTapped(category: type)
        }
    }

    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.shopView.tableView.reloadData()
        }
    }
}

extension ShopViewController: PresenterToViewShopCommunicator {
    func dismiss() {
        navigationController?.popViewController(animated: true)
    }
    
    func showAlert(_ type: AlertType) {
        let alert = AlertViewController(alertType: type)

        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve

        navigationController?.present(alert, animated: true)
    }
    
    func updateShopOffer(
        with items: [Item],
        ownedItemsID: [Int]
    ) {
        self.shopOffer = items
        self.ownedItemsID = ownedItemsID
    }
}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopOffer.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ShopItemCell.reuseID) as? ShopItemCell
        else { return UITableViewCell() }

        let item = shopOffer[indexPath.row]

        cell.set(item: item)
        
        if ownedItemsID.contains(where: { $0 == item.id }) {
            cell.backgroundColor = .systemGreen.withAlphaComponent(0.2)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = shopOffer[indexPath.row]

        tableView.deselectRow(at: indexPath, animated: true)

        presenter?.didSelect(item: item)

        reloadTableView()
    }
}

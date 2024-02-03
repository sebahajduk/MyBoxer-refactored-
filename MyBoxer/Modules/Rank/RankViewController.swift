//
//  RankVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/10/2022.
//

import UIKit

enum WeightDivisions {
    case lighweight, middleweight, heavyweight
}

final class RankViewController: UIViewController {
    var presenter: ViewToPresenterRankProtocol?
    private let rankView = RankView()

    private var lightweightBoxers = [Boxer]() {
        didSet {
            reloadCollections()
        }
    }

    private var middleweightBoxers = [Boxer]() {
        didSet {
            reloadCollections()
        }
    }

    private var heavyweightBoxers = [Boxer]() {
        didSet {
            reloadCollections()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        setupView()
    }
    
    private func setupView() {
        view = rankView

        [
            rankView.lightweightCollectionView,
            rankView.middleweightCollectionView,
            rankView.heavyweightCollectionView
        ].forEach { collectionView in
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }

    private func reloadCollections() {
        rankView.lightweightCollectionView.reloadData()
        rankView.middleweightCollectionView.reloadData()
        rankView.heavyweightCollectionView.reloadData()
    }
}
extension RankViewController: PresenterToViewRankProtocol {
    func updateViewForReceivedData(
        _ data: (
            lightweight: [Boxer],
            middleweight: [Boxer],
            heavyweight: [Boxer]
        )
    ) {
        lightweightBoxers = data.lightweight
        middleweightBoxers = data.middleweight
        heavyweightBoxers = data.heavyweight
    }
}

extension RankViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return lightweightBoxers.count
        case 1:
            return middleweightBoxers.count
        case 2:
            return heavyweightBoxers.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxerRankCell.reuseID, for: indexPath) as? BoxerRankCell
        else { return UICollectionViewCell() }

        var boxers = [Boxer]()
        
        switch collectionView.tag {
        case 0:
            boxers = lightweightBoxers.reversedArray()
        case 1:
            boxers = middleweightBoxers.reversedArray()
        case 2:
            boxers = heavyweightBoxers.reversedArray()
        default:
            cell.set(for: Boxer(), rank: indexPath.row)
        }
        
        cell.set(for: boxers[indexPath.row], rank: indexPath.row)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 100)
    }
}

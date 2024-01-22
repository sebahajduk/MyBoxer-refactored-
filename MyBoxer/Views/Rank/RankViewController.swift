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

class RankViewController: UIViewController {
    
    private let rankView = RankView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
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
}

extension RankViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 0:
            return Boxers.lightweightBoxers.count
        case 1:
            return Boxers.middleweightBoxers.count
        case 2:
            return Boxers.heavyweightBoxers.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxerRankCell.reuseID, for: indexPath) as? BoxerRankCell
        else { return UICollectionViewCell() }

        switch collectionView.tag {
        case 0:
            let rank = Array(Boxers.lightweightBoxers.reversed())
            cell.set(for: rank[indexPath.row], rank: indexPath.row)
        case 1:
            let rank = Array(Boxers.middleweightBoxers.reversed())
            cell.set(for: rank[indexPath.row], rank: indexPath.row)
        case 2:
            let rank = Array(Boxers.heavyweightBoxers.reversed())
            cell.set(for: rank[indexPath.row], rank: indexPath.row)
        default:
            cell.set(for: Boxer(), rank: indexPath.row)
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 100)
    }
}

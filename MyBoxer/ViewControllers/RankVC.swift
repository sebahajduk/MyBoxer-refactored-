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

class RankVC: UIViewController {
    
    let mainImage = UIImageView(image: Images.rank)
    
    let lightweightTitle = MBLabel(size: 16)
    let middleweightTitle = MBLabel(size: 16)
    let heavyweightTitle = MBLabel(size: 16)

    let lightweightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 0
        
        return collectionView
    }()
    
    let middleweightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 1
        
        return collectionView
    }()
    
    let heavyweightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 2
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        configureCollectionViews()
        configureConstraints()
    }
    
    private func configure() {
        view.addSubviews([mainImage, lightweightTitle, middleweightTitle, heavyweightTitle])
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        
        lightweightTitle.text = "Lightweight"
        middleweightTitle.text = "Middleweight"
        heavyweightTitle.text = "Heavyweight"
    }
    
    private func configureCollectionViews() {
        view.addSubviews([lightweightCollectionView, middleweightCollectionView, heavyweightCollectionView])
        
        lightweightCollectionView.translatesAutoresizingMaskIntoConstraints = false
        middleweightCollectionView.translatesAutoresizingMaskIntoConstraints = false
        heavyweightCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        lightweightCollectionView.delegate = self
        lightweightCollectionView.dataSource = self
        lightweightCollectionView.register(BoxerRankCell.self, forCellWithReuseIdentifier: BoxerRankCell.reuseID)
        
        middleweightCollectionView.delegate = self
        middleweightCollectionView.dataSource = self
        middleweightCollectionView.register(BoxerRankCell.self, forCellWithReuseIdentifier: BoxerRankCell.reuseID)
        
        heavyweightCollectionView.delegate = self
        heavyweightCollectionView.dataSource = self
        heavyweightCollectionView.register(BoxerRankCell.self, forCellWithReuseIdentifier: BoxerRankCell.reuseID)
        
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 150),
            mainImage.widthAnchor.constraint(equalToConstant: 150),
            
            lightweightTitle.topAnchor.constraint(equalTo: mainImage.bottomAnchor),
            lightweightTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lightweightTitle.heightAnchor.constraint(equalToConstant: 20),
            lightweightTitle.widthAnchor.constraint(equalToConstant: 100),
            
            lightweightCollectionView.topAnchor.constraint(equalTo: lightweightTitle.bottomAnchor, constant: 5),
            lightweightCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lightweightCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lightweightCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            middleweightTitle.topAnchor.constraint(equalTo: lightweightCollectionView.bottomAnchor, constant: 10),
            middleweightTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            middleweightTitle.heightAnchor.constraint(equalToConstant: 20),
            middleweightTitle.widthAnchor.constraint(equalToConstant: 100),
            
            middleweightCollectionView.topAnchor.constraint(equalTo: middleweightTitle.bottomAnchor, constant: 5),
            middleweightCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleweightCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            middleweightCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            heavyweightTitle.topAnchor.constraint(equalTo: middleweightCollectionView.bottomAnchor, constant: 10),
            heavyweightTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heavyweightTitle.heightAnchor.constraint(equalToConstant: 20),
            heavyweightTitle.widthAnchor.constraint(equalToConstant: 100),
            
            heavyweightCollectionView.topAnchor.constraint(equalTo: heavyweightTitle.bottomAnchor, constant: 20),
            heavyweightCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            heavyweightCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            heavyweightCollectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }

}

extension RankVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxerRankCell.reuseID, for: indexPath) as! BoxerRankCell
        
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

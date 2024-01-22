//
//  RankView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 18/01/2024.
//

import UIKit

class RankView: UIView {

    private let mainImage = UIImageView(image: Images.rank)

    private let lightweightTitle = MBLabel(size: 16)
    private let middleweightTitle = MBLabel(size: 16)
    private let heavyweightTitle = MBLabel(size: 16)

    private(set) var lightweightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 0

        return collectionView
    }()

    private(set) var middleweightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 1

        return collectionView
    }()

    private(set) var heavyweightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 2

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RankView {
    func setupView() {
        backgroundColor = .systemBackground
        
        setupLabelsAndImage()
        setupCollections()
        setupConstraints()
    }

    func setupLabelsAndImage() {
        addSubviews([mainImage, lightweightTitle, middleweightTitle, heavyweightTitle])

        lightweightTitle.text = "Lightweight"
        middleweightTitle.text = "Middleweight"
        heavyweightTitle.text = "Heavyweight"
    }

    func setupCollections() {
        addSubviews([lightweightCollectionView, middleweightCollectionView, heavyweightCollectionView])

        lightweightCollectionView.register(BoxerRankCell.self, forCellWithReuseIdentifier: BoxerRankCell.reuseID)
        middleweightCollectionView.register(BoxerRankCell.self, forCellWithReuseIdentifier: BoxerRankCell.reuseID)
        heavyweightCollectionView.register(BoxerRankCell.self, forCellWithReuseIdentifier: BoxerRankCell.reuseID)
    }

    func setupConstraints() {
        setupMainImageConstraints()
        setupLightweightTitleContraints()
        setupLightweightCollectionContraints()
        setupMiddleweightTitleConstraints()
        setupMiddleweightCollectionContraints()
        setupHeavyweightTitleConstraints()
        setupHeavyweightCollectionConstraints()
    }

    func setupMainImageConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 150),
            mainImage.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    func setupMiddleweightTitleConstraints() {
        NSLayoutConstraint.activate([
            middleweightTitle.topAnchor.constraint(equalTo: lightweightCollectionView.bottomAnchor, constant: 10),
            middleweightTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            middleweightTitle.heightAnchor.constraint(equalToConstant: 20),
            middleweightTitle.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    func setupHeavyweightTitleConstraints() {
        NSLayoutConstraint.activate([
            heavyweightTitle.topAnchor.constraint(equalTo: middleweightCollectionView.bottomAnchor, constant: 10),
            heavyweightTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            heavyweightTitle.heightAnchor.constraint(equalToConstant: 20),
            heavyweightTitle.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    func setupLightweightTitleContraints() {
        NSLayoutConstraint.activate([
            lightweightTitle.topAnchor.constraint(equalTo: mainImage.bottomAnchor),
            lightweightTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lightweightTitle.heightAnchor.constraint(equalToConstant: 20),
            lightweightTitle.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    func setupLightweightCollectionContraints() {
        NSLayoutConstraint.activate([
            lightweightCollectionView.topAnchor.constraint(equalTo: lightweightTitle.bottomAnchor, constant: 5),
            lightweightCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lightweightCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lightweightCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func setupMiddleweightCollectionContraints() {
        NSLayoutConstraint.activate([
            middleweightCollectionView.topAnchor.constraint(equalTo: middleweightTitle.bottomAnchor, constant: 5),
            middleweightCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            middleweightCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            middleweightCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func setupHeavyweightCollectionConstraints() {
        NSLayoutConstraint.activate([
            heavyweightCollectionView.topAnchor.constraint(equalTo: heavyweightTitle.bottomAnchor, constant: 20),
            heavyweightCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heavyweightCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heavyweightCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

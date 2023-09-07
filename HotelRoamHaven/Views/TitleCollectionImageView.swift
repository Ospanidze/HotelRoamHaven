//
//  TitleCollectionImageView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class TitleCollectionImageView: UIView {
    
    private var imagesURL: [String] = []
    
    private let imageCollectionView: UICollectionView = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = .horizontal
        collectionFlowLayout.minimumLineSpacing = 0
        collectionFlowLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collectionView.register(
            ImageCollectionViewCell.self,
            forCellWithReuseIdentifier: ImageCollectionViewCell.identifier
        )
        collectionView.layer.cornerRadius = 15
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let ratingView = RatingView()
    private let nameLabelsView = NameLabelsView()
    private let priceLabelsView = PriceLabelsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        backgroundColor = .white
        setupComponents()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Hostel) {
        ratingView.configure(with: model)
        nameLabelsView.configure(with: model)
        priceLabelsView.configure(with: model)
        imagesURL = model.imageUrls
        imageCollectionView.reloadData()
    }
    
    private func setupDelegates() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    private func setupComponents() {
        addSubviews(
            imageCollectionView,
            ratingView,
            nameLabelsView,
            priceLabelsView
        )
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension TitleCollectionImageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURL = imagesURL[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageCollectionViewCell.identifier,
            for: indexPath
        )
        guard let cell = cell as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: imageURL)
        return cell
    }
}

extension TitleCollectionImageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.bounds.width
//        let height = collectionView.bounds.height
//        return CGSize(width: width, height: height)
        collectionView.bounds.size
    }
}

extension TitleCollectionImageView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.62),
        ])
        
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 10),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ratingView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.38),
            ratingView.heightAnchor.constraint(equalToConstant: 29),
        ])
        
        NSLayoutConstraint.activate([
            nameLabelsView.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 5),
            nameLabelsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabelsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabelsView.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        NSLayoutConstraint.activate([
            priceLabelsView.topAnchor.constraint(equalTo: nameLabelsView.bottomAnchor, constant: 10),
            priceLabelsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceLabelsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceLabelsView.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
}

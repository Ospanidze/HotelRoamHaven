//
//  ImageCollectionView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 11.09.2023.
//

import UIKit

final class ImageCollectionView: UICollectionView {

    private let collectionFlowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionFlowLayout)
        
        setupConfigure()
        setupCollectionLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConfigure() {
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        layer.cornerRadius = 15
        isPagingEnabled = true
    }
    
    private func setupCollectionLayout() {
        collectionFlowLayout.scrollDirection = .horizontal
        collectionFlowLayout.minimumLineSpacing = 0
    }
}


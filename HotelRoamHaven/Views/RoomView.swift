//
//  RoomView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class RoomView: UIView {
    
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
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        //pageControl.numberOfPages = 1
        pageControl.backgroundColor = .white
        pageControl.pageIndicatorTintColor = .grayTextColor()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.layer.cornerRadius = 10
        pageControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        //pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        return pageControl
    }()
    
    private let titleLabel = UILabel(
        text: "dasdaasda",
        font: .mediumSFPro22(),
        numberOfLines: 0
    )
    
    private let peculiaritiesCollectionView = PeculiaritiesCollectionView()
    private let aboutRoomView = AboutRoomView()
    private let priceView = PriceLabelsView()
    
    private lazy var selectedButton = UIButton(
        title: "Выбрать номер",
        font: UIFont.mediumSFPro16()
    )
    
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
    
    private func setupDelegates() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    private func setupComponents() {
        addSubviews(
            imageCollectionView,
            pageControl,
            titleLabel,
            peculiaritiesCollectionView,
            aboutRoomView,
            priceView,
            selectedButton
        )
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension RoomView: UICollectionViewDataSource {
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

extension RoomView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        print(pageWidth)
        
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        print(scrollView.contentOffset.x)
        pageControl.currentPage = currentPage
    }
}

extension RoomView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageCollectionView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.52, constant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: -5),
            pageControl.centerXAnchor.constraint(equalTo: imageCollectionView.centerXAnchor),
            //pageControl.widthAnchor.constraint(lessThanOrEqualToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            peculiaritiesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            peculiaritiesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            peculiaritiesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            peculiaritiesCollectionView.heightAnchor.constraint(greaterThanOrEqualTo: titleLabel.heightAnchor),
        ])

        NSLayoutConstraint.activate([
            aboutRoomView.topAnchor.constraint(equalTo: peculiaritiesCollectionView.bottomAnchor, constant: 8),
            aboutRoomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aboutRoomView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.56),
            aboutRoomView.heightAnchor.constraint(equalToConstant: 29),
        ])
        
        NSLayoutConstraint.activate([
            priceView.topAnchor.constraint(equalTo: aboutRoomView.bottomAnchor, constant: 8),
            priceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceView.heightAnchor.constraint(equalToConstant: 36),
        ])

//
        NSLayoutConstraint.activate([
            //priceLabelsView.topAnchor.constraint(equalTo: nameLabelsView.bottomAnchor, constant: 15),
            selectedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            selectedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            selectedButton.heightAnchor.constraint(equalToConstant: 48),
            selectedButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

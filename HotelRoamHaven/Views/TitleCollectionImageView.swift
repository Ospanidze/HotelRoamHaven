//
//  TitleCollectionImageView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class TitleCollectionImageView: UIView {
    
    private var imagesURL: [String] = []
    
    private let imageCollectionView = ImageCollectionView()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        //pageControl.numberOfPages = 1
        pageControl.backgroundColor = .white
        pageControl.pageIndicatorTintColor = .grayTextColor()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.layer.cornerRadius = 10
        pageControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        //pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        return pageControl
    }()
    
    //private let 
    
    private let ratingView = RatingView()
    private let nameLabelsView = NameView()
    private let priceLabelsView = PriceView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        backgroundColor = .white
        setupComponents()
        setupDelegates()
        imageCollectionView.register(
            ImageCollectionViewCell.self,
            forCellWithReuseIdentifier: ImageCollectionViewCell.identifier
        )
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
        pageControl.numberOfPages = model.imageUrls.count
    }
    
    @objc func pageControlValueChanged() {
        let currentPage = pageControl.currentPage
        let contentOffset = CGPoint(x: CGFloat(currentPage) * imageCollectionView.frame.size.width, y: 0)
        imageCollectionView.setContentOffset(contentOffset, animated: true)
    }
    
    private func setupDelegates() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    private func setupComponents() {
        addSubviews(
            imageCollectionView,
            pageControl,
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
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        print(pageWidth)
        
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        print(scrollView.contentOffset.x)
        pageControl.currentPage = currentPage
    }
}

extension TitleCollectionImageView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.56),
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: -5),
            pageControl.centerXAnchor.constraint(equalTo: imageCollectionView.centerXAnchor),
            //pageControl.widthAnchor.constraint(lessThanOrEqualToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 15),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ratingView.heightAnchor.constraint(equalToConstant: 29),
        ])
        
        NSLayoutConstraint.activate([
            nameLabelsView.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 10),
            nameLabelsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabelsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabelsView.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        NSLayoutConstraint.activate([
            //priceLabelsView.topAnchor.constraint(equalTo: nameLabelsView.bottomAnchor, constant: 15),
            priceLabelsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceLabelsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceLabelsView.heightAnchor.constraint(equalToConstant: 36),
            priceLabelsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

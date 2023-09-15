//
//  RoomView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

protocol RoomViewDelegate: AnyObject {
    func didTapped()
}

final class RoomView: UIView {
    
    weak var roomViewDelegate: RoomViewDelegate?
    
    //MARK: Private Properties
    private var imagesURL: [String] = []
    
    private let imageCollectionView = ImageCollectionView()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .white
        pageControl.pageIndicatorTintColor = .grayTextColor()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.layer.cornerRadius = 10
        pageControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        return pageControl
    }()
    
    //MARK: Private Methods
    @objc func pageControlValueChanged() {
        let currentPage = pageControl.currentPage
        let contentOffset = CGPoint(x: CGFloat(currentPage) * imageCollectionView.frame.size.width, y: 0)
        imageCollectionView.setContentOffset(contentOffset, animated: true)
    }
    
    private let titleLabel = UILabel(
        text: "Стандартный с видом на бассейн или сад",
        font: .mediumSFPro22(),
        numberOfLines: 0
    )
    
    private let peculiaritiesCollectionView = PeculiaritiesCollectionView()
    private let aboutRoomView = AboutRoomView()
    private let priceView = PriceView()
    
    private lazy var selectedButton = UIButton(
        title: "Выбрать номер",
        font: UIFont.mediumSFPro16()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepaView()
        setupComponents()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with room: Room) {
        imagesURL = room.imageUrls
        imageCollectionView.reloadData()
        pageControl.numberOfPages = room.imageUrls.count
        titleLabel.text = room.name
        peculiaritiesCollectionView.configure(with: room)
        priceView.configure(with: room)
    }
    
    private func prepaView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        backgroundColor = .white
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
        
        imageCollectionView.register(
            ImageCollectionViewCell.self,
            forCellWithReuseIdentifier: ImageCollectionViewCell.identifier
        )
        
        selectedButton.addTarget(
            self,
            action: #selector(selectedButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    @objc private func selectedButtonTapped() {
        roomViewDelegate?.didTapped()
    }
}

//MARK: - UICollectionViewDataSource
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

//MARK: - UICollectionViewDelegateFlowLayout
extension RoomView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
    }
}

//MARK: SetupLayout
extension RoomView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageCollectionView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.48, constant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: -5),
            pageControl.centerXAnchor.constraint(equalTo: imageCollectionView.centerXAnchor),
            //pageControl.widthAnchor.constraint(lessThanOrEqualToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 56),
        ])
        
        NSLayoutConstraint.activate([
            peculiaritiesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            peculiaritiesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            peculiaritiesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //peculiaritiesCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.70),
            peculiaritiesCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 29),
        ])

        NSLayoutConstraint.activate([
            aboutRoomView.topAnchor.constraint(equalTo: peculiaritiesCollectionView.bottomAnchor, constant: 8),
            aboutRoomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aboutRoomView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.56),
            aboutRoomView.heightAnchor.constraint(equalToConstant: 29),
        ])
        
        NSLayoutConstraint.activate([
            priceView.bottomAnchor.constraint(equalTo: selectedButton.topAnchor, constant: -8),
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

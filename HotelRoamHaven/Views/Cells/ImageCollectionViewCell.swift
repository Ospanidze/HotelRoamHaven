//
//  ImageCollectionViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    private let networkManager = NetworkManager.shared
    
    private var image: UIImage? {
        didSet {
            hotelImageView.image = image
            activityIndicator.stopAnimating()
            activityIndicator.hidesWhenStopped = true
        }
    }
    
    private let hotelImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(systemName: "person")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageString: String) {
        networkManager.fetchImage(from: imageString) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    private func setupViews() {
        addSubview(hotelImageView)
        addSubview(activityIndicator)
    }
}

extension ImageCollectionViewCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            hotelImageView.topAnchor.constraint(equalTo: topAnchor),
            hotelImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hotelImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hotelImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: hotelImageView.centerXAnchor
            ),
            activityIndicator.centerYAnchor.constraint(
                equalTo: hotelImageView.centerYAnchor
            )
        ])
    }
}

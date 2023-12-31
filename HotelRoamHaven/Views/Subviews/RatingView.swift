//
//  RatingView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class RatingView: UIView {
    
    //MARK: Private Properties
    private let ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .orangeTextColor()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let numberRatingLabel = UILabel(
        text: "5 Превосходно",
        font: UIFont.mediumSFPro16(),
        textColor: .orangeTextColor()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public Methods
    func configure(with model: Hostel) {
        numberRatingLabel.text = "\(model.rating) " + model.ratingName
    }
    
    func configure(with model: InfoHostel) {
        numberRatingLabel.text = "\(model.horating) " + model.ratingName
    }
    
    //MARK: Private Methods
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 5
        backgroundColor = .orangeColor()
    }
    
    private func setupComponents() {
        addSubviews(ratingImageView, numberRatingLabel)
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
}

//MARK: SetupLayout
extension RatingView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            ratingImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            ratingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ratingImageView.heightAnchor.constraint(equalToConstant: 15),
            ratingImageView.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            numberRatingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberRatingLabel.leadingAnchor.constraint(
                equalTo: ratingImageView.trailingAnchor,
                constant: 3
            ),
            numberRatingLabel.heightAnchor.constraint(equalToConstant: 15),
            numberRatingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}

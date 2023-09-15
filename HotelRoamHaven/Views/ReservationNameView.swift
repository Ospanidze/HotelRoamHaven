//
//  ReservationNameView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 11.09.2023.
//

import UIKit

final class ReservationNameView: UIView {
    
    //MARK: Private Properties
    private let ratingView = RatingView()
    
    private let nameView = NameView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareView()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public Methods
    func configure(with model: InfoHostel) {
        ratingView.configure(with: model)
        nameView.configure(with: model)
    }
    
    //MARK: Private Methods
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        backgroundColor = .white
    }
    
    private func setupViews() {
        addSubview(ratingView)
        addSubview(nameView)
    }
}

//MARK: SetupLayout
extension ReservationNameView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            //ratingView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
            ratingView.heightAnchor.constraint(equalToConstant: 29),
            
            
            nameView.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 8),
            nameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            //nameView.heightAnchor.constraint(lessThanOrEqualToConstant: 52)
        ])
    }
}

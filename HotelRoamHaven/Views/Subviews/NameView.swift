//
//  NameLabelsView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class NameView: UIView {
    
    private let nameLabel = UILabel(
        text: "Steigenberber Makadi",
        font: .mediumSFPro22(),
        numberOfLines: 0
    )
    
    private let adressLabel = UILabel(
        text: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
        font: .mediumSFPro14(),
        textColor: .blueColor()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Hostel) {
        nameLabel.text = model.name
        adressLabel.text = model.adress
    }
    
    func configure(with model: InfoHostel) {
        nameLabel.text = model.hotelName
        adressLabel.text = model.hotelAdress
    }
    
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupComponents() {
        addSubviews(nameLabel, adressLabel)
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension NameView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            adressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            adressLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

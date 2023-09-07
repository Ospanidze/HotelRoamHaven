//
//  NameLabelsView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class NameLabelsView: UIView {
    
    private let nameLabel = UILabel(
        text: "Steigenberber",
        font: .mediumSFPro22()
    )
    
    private let adressLabel = UILabel(
        text: "Madinat Makadi, Safaga",
        font: .mediumSFPro14(),
        textColor: .blueColor()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Hostel) {
        nameLabel.text = model.name
        adressLabel.text = model.adress
    }
    
    private func setupComponents() {
        addSubviews(nameLabel, adressLabel)
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension NameLabelsView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //nameLabel.heightAnchor.constraint(equalToConstant: 26),
        ])
        
        NSLayoutConstraint.activate([
            adressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            adressLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //addressLabel.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
}

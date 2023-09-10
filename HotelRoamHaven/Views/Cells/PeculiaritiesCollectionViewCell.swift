//
//  PeculiaritiesCollectionViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class PeculiaritiesCollectionViewCell: UICollectionViewCell {
    
    private let peculiarLabel = UILabel(
        text: "все включено",
        font: .mediumSFPro16(),
        textColor: .grayTextColor()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .grayBackgroundColor()
        layer.cornerRadius = 5
        
        setupViews()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with peculiarStr: String) {
        peculiarLabel.text = peculiarStr
    }
    
    private func setupViews() {
        addSubview(peculiarLabel)
    }
}

extension PeculiaritiesCollectionViewCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            peculiarLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            peculiarLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            //peculiarLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            //peculiarLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            //peculiarLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65)
        ])
       
    }
}



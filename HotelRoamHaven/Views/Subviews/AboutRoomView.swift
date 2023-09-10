//
//  AboutRoomView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class AboutRoomView: UIView {
    
    private let titleLabel = UILabel(
        text: "Подробнее о номере",
        font: .mediumSFPro16(),
        textColor: .blueColor()
    )
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blueColor().withAlphaComponent(0.1)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(chevronImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            chevronImageView.topAnchor.constraint(equalTo: topAnchor),
            chevronImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chevronImageView.widthAnchor.constraint(equalTo: chevronImageView.heightAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor),
        ])
    }
}

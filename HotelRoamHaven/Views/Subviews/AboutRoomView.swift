//
//  AboutRoomView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class AboutRoomView: UIView {
    
    //MARK: Private Properties
    private let titleLabel = UILabel(
        text: "Подробнее о номере",
        font: .mediumSFPro16(),
        textColor: .blueColor()
    )
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .blueColor()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private Methods
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blueColor().withAlphaComponent(0.1)
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(chevronImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            chevronImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            //chevronImageView.widthAnchor.constraint(equalToConstant: 6)
        ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -4),
        ])
    }
}

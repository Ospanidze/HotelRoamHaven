//
//  TouristTableViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class TouristTableViewCell: UITableViewCell {
    
    static let identifier = "TouristTableViewCell"
    
    private let informationTouristView = InformationTouristView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.cornerRadius = 12
        backgroundColor = .grayBackgroundColor()
        selectionStyle = .none
        setupViews()
        setupLayout()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(informationTouristView)
    }
}

extension TouristTableViewCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            informationTouristView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            informationTouristView.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationTouristView.trailingAnchor.constraint(equalTo: trailingAnchor),
            informationTouristView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
}

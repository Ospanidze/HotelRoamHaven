//
//  ReservationTableViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 11.09.2023.
//

import UIKit

final class ReservationTableViewCell: UITableViewCell {
    
    static let identifier = "ReservationTableViewCell"
    
    private let descriptionLabel = UILabel(
        text: "Вылет из",
        font: .regularSFPro16(),
        textColor: .grayTextColor()
    )
    
    private let nameLabel = UILabel(text: "Cанк петербург", font: .regularSFPro16())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with option: String, text: String) {
        descriptionLabel.text = option
        nameLabel.text = text
    }
    
    private func setupViews() {
        selectionStyle = .none
        
        addSubview(descriptionLabel)
        addSubview(nameLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
    }
}


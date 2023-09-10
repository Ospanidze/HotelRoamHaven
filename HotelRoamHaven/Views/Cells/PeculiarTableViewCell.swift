//
//  PeculiarTableViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class PeculiarTableViewCell: UITableViewCell {
    
    static let identifier = "TouristTableViewCell"
    
    private let roomView = RoomView()
    
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
        contentView.addSubview(roomView)
    }
}

extension PeculiarTableViewCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            roomView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            roomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            roomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
}

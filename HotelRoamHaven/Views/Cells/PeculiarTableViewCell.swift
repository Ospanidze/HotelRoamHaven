//
//  PeculiarTableViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

protocol PeculiarTableViewCellDelegate: AnyObject {
    func cellButtonTapped()
}

final class PeculiarTableViewCell: UITableViewCell {
    
    weak var peculiarDelegate: PeculiarTableViewCellDelegate?
    
    static let identifier = "TouristTableViewCell"
    
    private let roomView = RoomView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.cornerRadius = 12
        backgroundColor = .grayBackgroundColor()
        selectionStyle = .none
        setupViews()
        setupLayout()
        roomView.roomViewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with room: Room) {
        roomView.configure(with: room)
    }
    
    private func setupViews() {
        contentView.addSubview(roomView)
    }
}

extension PeculiarTableViewCell: RoomViewDelegate {
    func didTapped() {
        peculiarDelegate?.cellButtonTapped()
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

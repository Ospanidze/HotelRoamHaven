//
//  TitleTextTableViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class TitleTextTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTextTableViewCell"
    
    private let titleTextFieldView = TitleTextFieldView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        titleTextFieldView.configure(with: title)
    }
    
    func getCellValue() -> String {
        titleTextFieldView.getVallueCell()
    }
    
    private func setupViews() {
        selectionStyle = .none
        contentView.addSubview(titleTextFieldView)
    }
}

extension TitleTextTableViewCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleTextFieldView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleTextFieldView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleTextFieldView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleTextFieldView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

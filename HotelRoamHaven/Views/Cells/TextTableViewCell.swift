//
//  TextTableViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 12.09.2023.
//

import UIKit

final class TextTableViewCell: UITableViewCell {
    
    static let identifier = "TextTableViewCell"
    
    private let textFieldView = TextFieldView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public Methods
    func configure(with placeholder: String) {
        textFieldView.configure(with: placeholder)
    }
    
    func getValueCell() -> String {
        textFieldView.getValueCell()
    }
    
    //MARK: Private Methods
    private func setupViews() {
        selectionStyle = .none
        contentView.addSubview(textFieldView)
    }
}

//MARK: SetupLayout
extension TextTableViewCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            textFieldView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textFieldView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textFieldView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

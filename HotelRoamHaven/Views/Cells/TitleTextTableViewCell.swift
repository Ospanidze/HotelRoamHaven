//
//  TitleTextTableViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

protocol TitleTextTableViewCellDelegate: AnyObject {
    func testing(text: String)
}

final class TitleTextTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTextTableViewCell"
    
    weak var cellDelegate: TitleTextTableViewCellDelegate?
    
    private let titleTextFieldView = TitleTextFieldView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public Methods 
    func configure(with title: String) {
        titleTextFieldView.configure(with: title)
    }
    
    func getCellValue() -> String {
        titleTextFieldView.getVallueCell()
    }
    
    //MARK: Private Methods
    private func setupViews() {
        selectionStyle = .none
        contentView.addSubview(titleTextFieldView)
    }
}

//MARK: SetupLayout
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

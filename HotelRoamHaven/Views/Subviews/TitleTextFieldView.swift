//
//  TitleTextFieldView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class TitleTextFieldView: UIView {
    
    private let titleLabel = UILabel(
        text: "dasd",
        font: .regularSFPro12(),
        textColor: .grayTextColor()
    )
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "+7(***)***-**-**"
        textField.font = .regularSFPro16()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .grayBackgroundColor()
        layer.cornerRadius = 10
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(titleTextField)
    }
}

extension TitleTextFieldView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}

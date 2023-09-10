//
//  TextFiledView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class TextFiledView: UITextField {
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "+7(***)***-**-**"
        textField.font = .regularSFPro17()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    init(placeholder: String) {
        super.init(frame: .zero)
        titleTextField.placeholder = placeholder
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
        addSubview(titleTextField)
    }
}

extension TextFiledView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}


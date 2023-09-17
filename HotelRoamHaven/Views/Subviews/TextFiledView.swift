//
//  TextFiledView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class TextFieldView: UIView {
    
    //MARK: Private Properties
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = .regularSFPro17()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareView()
        setupViews()
        setupLayout()
        setupPlaceholder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public Methods
    func configure(with placeholder: String) {
        titleTextField.placeholder = placeholder
    }
    
    func getValueCell() -> String {
        titleTextField.text ?? ""
    }
    
    //MARK: Private Methods
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = .grayBackgroundColor()
    }
    
    private func setupViews() {
        addSubview(titleTextField)
    }
    
    private func setupPlaceholder() {
        let font = UIFont.regularSFPro17()
        
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "Введите данные",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                NSAttributedString.Key.font: font as Any
            ]
        )
    }
}

//MARK: - UITextFieldDelegate
extension TextFieldView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//MARK: SetupLayout
extension TextFieldView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}


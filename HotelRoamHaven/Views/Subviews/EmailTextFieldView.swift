//
//  EmailTextFieldView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 14.09.2023.
//

import UIKit

final class EmailTextFieldView: UIView {
    
    private let titleLabel = UILabel(
        text: "dasd",
        font: .regularSFPro12(),
        textColor: .grayTextColor()
    )
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Нет данных"
        textField.font = .regularSFPro16()
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init(text: String) {
        super.init(frame: .zero)
        titleLabel.text = text
        prepareView()
        setupViews()
        setupLayout()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    func getVallueCell() -> String {
        titleTextField.text ?? ""
    }
    
    private func getValueIsValid(_ isValid: Bool) {
        let color = isValid ? UIColor.grayTextColor() : #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 0.5)
        titleLabel.textColor = color
    }
    
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .grayBackgroundColor()
        layer.cornerRadius = 10
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(titleTextField)
    }
    
    private func setupDelegates() {
        titleTextField.delegate = self
    }
}

extension EmailTextFieldView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text, let rangeText = Range(range, in: text) {
            let updateText = text.replacingCharacters(in: rangeText, with: string)
            getValueIsValid(updateText.isValid())
        }
        return true
    }
}

extension EmailTextFieldView {
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

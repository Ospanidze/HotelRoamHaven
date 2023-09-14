//
//  NumberTextFieldView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 14.09.2023.
//

import UIKit

final class NumberTextFieldView: UIView {
    
    private var isTyping = false {
        didSet {
            if self.isTyping {
                numberTextField.alpha = 0.05
                numberLabel.isHidden = false
            } else {
                numberTextField.alpha = 1
                numberLabel.isHidden = true
            }
        }
    }
    
    private let titleNumberLabel = UILabel(
        text: "Номер телефона",
        font: .regularSFPro12(),
        textColor: .grayTextColor()
    )
    
    private lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Нет данных"
        textField.font = .regularSFPro16()
        textField.keyboardType = .numberPad
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let numberLabel = UILabel(
        text: "",
        font: .regularSFPro16(),
        textColor: .grayTextColor()
    )
    
    init(text: String) {
        super.init(frame: .zero)
        titleNumberLabel.text = text
        prepareView()
        setupViews()
        setupLayout()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getVallueCell() -> String {
        numberTextField.text ?? ""
    }
    
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .grayBackgroundColor()
        layer.cornerRadius = 10
        numberLabel.isHidden = true
    }
    
    private func setupViews() {
        addSubview(titleNumberLabel)
        addSubview(numberTextField)
        addSubview(numberLabel)
    }
    
    private func setupDelegates() {
        numberTextField.delegate = self
    }
}

extension NumberTextFieldView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text, let rangeText = Range(range, in: text) {
            isTyping = true
            
            let updateText = text.replacingCharacters(in: rangeText, with: string)
            
            if updateText.count < 11 {
                print(updateText.count)
                print(updateText.formatMobileNumber())
                
                numberLabel.text = updateText.formatMobileNumber()
                if updateText == "" {
                    isTyping = false
                }
                
                return true
            } else {
                return false
            }
        }
        return true
    }
}

extension NumberTextFieldView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: titleNumberLabel.bottomAnchor),
            numberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
           // numberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: titleNumberLabel.bottomAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            //numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}


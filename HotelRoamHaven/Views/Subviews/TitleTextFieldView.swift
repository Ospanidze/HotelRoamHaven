//
//  TitleTextFieldView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit
//import libPhoneNumber_iOS

final class TitleTextFieldView: UIView {
    
    private let titleLabel = UILabel(
        text: "dasd",
        font: .regularSFPro12(),
        textColor: .grayTextColor()
    )
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Нет данных"
        textField.font = .regularSFPro16()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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

extension TitleTextFieldView: UITextFieldDelegate {
    

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

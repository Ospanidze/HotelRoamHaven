//
//  TitleTextFieldView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class TitleTextFieldView: UIView {
    
    //MARK: Private Properties
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public Methods
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    func getVallueCell() -> String {
        titleTextField.text ?? ""
    }
    
    //MARK: Private Methods
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .grayBackgroundColor()
        layer.cornerRadius = 10
        titleTextField.delegate = self
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(titleTextField)
    }
}

//MARK: - UITextFieldDelegate
extension TitleTextFieldView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//MARK: SetupLayout
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

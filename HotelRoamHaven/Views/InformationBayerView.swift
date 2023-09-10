//
//  InformationBayerView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class InformationBayerView: UIView {
    
    private let titleLabel = UILabel(
        text: "Информация о покупателе",
        font: .mediumSFPro22()
    )
    
    private let numberTitleTextView = TitleTextFieldView(title: "номер")
    private let emailTitleTextView = TitleTextFieldView(title: "почта")
    
    private let notificationLabel = UILabel(
        text: "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту",
        font: .regularSFPro14(),
        textColor: .grayTextColor(),
        numberOfLines: 0
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(numberTitleTextView)
        addSubview(emailTitleTextView)
        addSubview(notificationLabel)
    }
}

extension InformationBayerView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            numberTitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            numberTitleTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            numberTitleTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            numberTitleTextView.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            emailTitleTextView.topAnchor.constraint(
                equalTo: numberTitleTextView.bottomAnchor,
                constant: 8
            ),
            emailTitleTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTitleTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emailTitleTextView.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        NSLayoutConstraint.activate([
            notificationLabel.topAnchor.constraint(equalTo: emailTitleTextView.bottomAnchor, constant: 8),
            notificationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            notificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //numberTitleTextView.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}

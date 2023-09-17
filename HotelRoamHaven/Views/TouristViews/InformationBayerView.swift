//
//  InformationBayerView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class InformationBayerView: UIView {
    
    //MARK: Private Properties
    private let titleLabel = UILabel(
        text: "Информация о покупателе",
        font: .mediumSFPro22()
    )
    
    private let numberTitleView = NumberTextFieldView(text: "номер телефона")
    private let emailView = EmailTextFieldView(text: "почта")
    
    private let notificationLabel = UILabel(
        text: "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту",
        font: .regularSFPro14(),
        textColor: .grayTextColor(),
        numberOfLines: 0
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        preparaView()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private Methods
    private func preparaView() {
        backgroundColor = .white
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(notificationLabel)
        addSubview(numberTitleView)
        addSubview(emailView)
    }
}

//MARK: SetupLayout
extension InformationBayerView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            numberTitleView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            numberTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            numberTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            numberTitleView.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: numberTitleView.bottomAnchor, constant: 8),
            emailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emailView.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            //notificationLabel.topAnchor.constraint(equalTo: informationTableView.bottomAnchor),
            notificationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            notificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //numberTitleTextView.heightAnchor.constraint(equalToConstant: 52)
            notificationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}

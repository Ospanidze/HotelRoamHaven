//
//  InfomationTouristView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

protocol InformationTouristViewDelegate: AnyObject {
    func checkAnimation()
}

final class InformationTouristView: UIView {
    
    weak var delegate: InformationTouristViewDelegate?
    
    
    private let titleLabel = UILabel(
        text: "Первый турист",
        font: .mediumSFPro22()
    )
    
    private lazy var hideButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        button.setImage(UIImage(systemName: "chevron.down"), for: .highlighted)
        //button.setImage(UIImage(systemName: "chevron.down"), for: .reserved)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5422510505, blue: 1, alpha: 0.1)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleInformationView), for: .touchUpInside)
        return button
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.isHidden = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let nameTitleTextView = TitleTextFieldView(title: "имя")
    private let surnameTitleTextView = TitleTextFieldView(title: "фамилия")
    
    private let dateBirthdayTextFiled = TextFiledView(placeholder: "Дата рождения")
    private let nationalityTextFiled = TextFiledView(placeholder: "Гражданство")
    private let numberPassportTextFiled = TextFiledView(placeholder: "Номер загранпаспорта")
    private let validityPassportTextFiled = TextFiledView(placeholder: "Срок действия загранпаспорта")
    
    //private lazy var heightConstraint = informationView.heightAnchor.constraint(equalToConstant: 430)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        backgroundColor = .white
        
        setupViews()
        setupLayout()
        
        //heightConstraint = mainStackView.heightAnchor.constraint(equalToConstant: 0)
        //heightConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isChecking(_ bool: Bool) {
//        mainStackView.isHidden = bool
//        if bool {
//            hideButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
//        } else {
//            hideButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
//        }
        
    }
    
    @objc private func toggleInformationView() {
        //print("tapped")
        //delegate?.checkAnimation()
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(hideButton)
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(nameTitleTextView)
        mainStackView.addArrangedSubview(surnameTitleTextView)
        mainStackView.addArrangedSubview(dateBirthdayTextFiled)
        mainStackView.addArrangedSubview(nationalityTextFiled)
        mainStackView.addArrangedSubview(numberPassportTextFiled)
        mainStackView.addArrangedSubview(validityPassportTextFiled)
    }
}

extension InformationTouristView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            hideButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            hideButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hideButton.heightAnchor.constraint(equalToConstant: 32),
            hideButton.widthAnchor.constraint(equalTo: hideButton.heightAnchor)
        ])
        
        //nationalityTextFiled.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        
        NSLayoutConstraint.activate([
            nationalityTextFiled.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12),
            
            mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //mainStackView.heightAnchor.constraint(equalToConstant: 52)
        ])
        
   
    }
}

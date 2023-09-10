//
//  AddTouristView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class AddTouristView: UIView {
    
    private let titleLabel = UILabel(
        text: "Добавить туриста",
        font: .mediumSFPro22()
    )
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        //button.setImage(UIImage(systemName: "plus.square"), for: .normal)
        button.setBackgroundImage(UIImage(systemName: "plus.square"), for: .normal)
        //button.setImage(UIImage(systemName: "chevron.down"), for: .highlighted)
        //button.setImage(UIImage(systemName: "chevron.down"), for: .reserved)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5422510505, blue: 1, alpha: 0.1)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(toggleInformationView), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 10
        
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(addButton)
    }
}

extension AddTouristView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 32),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
        ])
    }
}

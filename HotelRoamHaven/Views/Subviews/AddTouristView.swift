//
//  AddTouristView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

protocol AddTouristViewDelegate: AnyObject {
    func addNewExpanded()
}

final class AddTouristView: UIView {
    
    weak var addTouristViewDelegate: AddTouristViewDelegate?
    
    //MARK: Private Properties
    private let titleLabel = UILabel(
        text: "Добавить туриста",
        font: .mediumSFPro22()
    )
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blueColor()
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
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
    
    //MARK: Private Methods
    @objc private func addButtonTapped() {
        addTouristViewDelegate?.addNewExpanded()
    }
    
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 10
    }
        
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(addButton)
    }
}

//MARK: SetupLayout
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

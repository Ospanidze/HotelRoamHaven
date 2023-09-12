//
//  TestView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 12.09.2023.
//

import UIKit

protocol TestViewDelegate: AnyObject {
    func didTapped(tag: Int)
}

final class TestView: UIView {
    
    weak var testViewDelegate: TestViewDelegate?
    
    static let identifier = "TestView"
    
    private let titleLabel = UILabel(
        text: "Первый турист",
        font: .mediumSFPro22()
    )
    
    private lazy var hideButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        //button.setImage(UIImage(systemName: "chevron.down"), for: .highlighted)
        //button.setImage(UIImage(systemName: "chevron.down"), for: .reserved)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5422510505, blue: 1, alpha: 0.1)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(hideButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(section: Int, isExpanded: Bool) {
        titleLabel.text = section.convertStringValue() + " " + "турист"
        hideButton.tag = section
        hideButton.setImage(
            UIImage(systemName: isExpanded ? "chevron.up" : "chevron.down"),
            for: .normal
        )

    }
    
    @objc private func hideButtonTapped(sender: UIButton) {
        testViewDelegate?.didTapped(tag: sender.tag)
        let image = sender.currentImage == UIImage(systemName: "chevron.up")
        ? UIImage(systemName: "chevron.down")
        : UIImage(systemName: "chevron.up")
        sender.setImage(image, for: .normal)
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(hideButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            //titleLabel.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hideButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            hideButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hideButton.heightAnchor.constraint(equalToConstant: 32),
            hideButton.widthAnchor.constraint(equalTo: hideButton.heightAnchor)
        ])
    }
    
}

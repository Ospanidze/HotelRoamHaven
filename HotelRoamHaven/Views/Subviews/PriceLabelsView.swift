//
//  PriceLabelsView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class PriceLabelsView: UIView {
    
    private let priceLabel = UILabel(
        text: "от 134 436 Р",
        font: .semiboldSFPro()
    )
    
    private let additionalLabel = UILabel(
        text: "за тур с перелетом",
        font: .regularSFPro16(),
        textColor: .grayTextColor()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Hostel) {
        priceLabel.text = " oт \(model.minimalPrice) Р"
        additionalLabel.text = model.priceForIt
    }
    
    private func setupComponents() {
        addSubviews(priceLabel, additionalLabel)
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension PriceLabelsView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.46),
            //priceLabel.heightAnchor.constraint(equalToConstant: 26),
        ])
        
        NSLayoutConstraint.activate([
            additionalLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            additionalLabel.leadingAnchor.constraint(
                equalTo: priceLabel.trailingAnchor,
                constant: 5
            ),
            additionalLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //addressLabel.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
}

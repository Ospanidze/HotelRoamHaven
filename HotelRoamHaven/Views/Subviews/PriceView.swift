//
//  PriceLabelsView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class PriceView: UIView {
    
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
        prepareView()
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Hostel) {
        priceLabel.text = " oт \(model.minimalPrice) Р"
        additionalLabel.text = model.priceForIt
    }
    
    func configure(with room: Room) {
        priceLabel.text = " oт \(room.price) Р"
        additionalLabel.text = room.pricePer
    }
    
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupComponents() {
        addSubviews(priceLabel, additionalLabel)
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension PriceView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            //priceLabel.heightAnchor.constraint(equalToConstant: 26),
        ])
        
        NSLayoutConstraint.activate([
            additionalLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            additionalLabel.leadingAnchor.constraint(
                equalTo: priceLabel.trailingAnchor
            ),
            additionalLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //addressLabel.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
}
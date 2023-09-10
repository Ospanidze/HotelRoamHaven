//
//  UIStackView + ext.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 08.09.2023.
//

import UIKit

extension UIStackView {
    
    convenience init(spacing: CGFloat, aligment: UIStackView.Alignment, axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution) {
        self.init()
        self.spacing = spacing
        self.alignment = aligment
        self.axis = axis
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

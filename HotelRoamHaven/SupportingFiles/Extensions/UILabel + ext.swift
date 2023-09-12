//
//  UILabel + ext.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font:UIFont?, textColor: UIColor = .black, textAlingment: NSTextAlignment = .left, backColor: UIColor = .clear, numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlingment
        self.backgroundColor = backColor
        self.numberOfLines = numberOfLines
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

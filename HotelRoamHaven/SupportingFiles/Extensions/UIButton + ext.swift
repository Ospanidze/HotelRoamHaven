//
//  UIButton + ext.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, font: UIFont?) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = font
        self.layer.cornerRadius = 15
        self.backgroundColor = UIColor.blueColor()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

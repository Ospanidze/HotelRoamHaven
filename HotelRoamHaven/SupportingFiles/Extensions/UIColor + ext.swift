//
//  UIColor + ext.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

extension UIColor {
    
    static func grayBackgroundColor() -> UIColor {
        let color = #colorLiteral(red: 0.964705646, green: 0.9647061229, blue: 0.9776162505, alpha: 1)
        return color
    }
    
    static func orangeColor() -> UIColor {
        let color = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 0.2)
        return color
    }
    
    static func orangeTextColor() -> UIColor {
        let color = #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
        return color
    }
    
    static func grayTextColor() -> UIColor {
        let color = #colorLiteral(red: 0.5098039216, green: 0.5294117647, blue: 0.5882352941, alpha: 1)
        return color
    }
    
    static func blueColor() -> UIColor {
        let color = #colorLiteral(red: 0.05098039216, green: 0.4470588235, blue: 1, alpha: 1)
        return color
    }
}

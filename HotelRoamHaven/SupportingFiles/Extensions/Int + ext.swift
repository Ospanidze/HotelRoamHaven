//
//  Int + ext.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 12.09.2023.
//

import Foundation

extension Int {
    
    func convertStringValue() -> String {
        switch self {
        case 0:
            return "Первый"
        case 1:
            return "Второй"
        case 2:
            return "Третий"
        case 3:
            return "Четвертый"
        case 4:
            return "Пятый"
        case 5:
            return "Шестой"
        default:
            return "Все блять!"
        }
    }
}

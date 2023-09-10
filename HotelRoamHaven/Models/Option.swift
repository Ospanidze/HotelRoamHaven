//
//  Option.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import Foundation

struct Option {
    let title: String
    let imageString: String
    
    static func getOptions() -> [Option] {
        [
            Option(title: "Удобство", imageString: "happy"),
            Option(title: "Что включено", imageString: "checkmark.square"),
            Option(title: "Что не включено", imageString: "xmark.square")
        ]
    }
}

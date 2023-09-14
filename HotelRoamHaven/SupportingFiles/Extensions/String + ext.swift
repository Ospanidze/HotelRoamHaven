//
//  String + ext.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 14.09.2023.
//

import Foundation

extension String {
    func isValid() -> Bool {
        let format = "SELF MATCHES %@"
        let regEx = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
    
    func formatMobileNumber() -> String {
        let cleanPhoneNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mark = "+7(***)-***-**-**"
        
        var result = ""
        var startIndex = cleanPhoneNumber.firstIndex(of: "*") ??  cleanPhoneNumber.startIndex
        let endIndex = cleanPhoneNumber.endIndex
        
        for char in mark where startIndex < endIndex {
            if char == "*" {
                result.append(cleanPhoneNumber[startIndex])
                startIndex = cleanPhoneNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        return result
    }
}

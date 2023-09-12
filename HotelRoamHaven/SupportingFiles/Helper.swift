//
//  Helper.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 11.09.2023.
//

import UIKit

enum OptionField: String, CaseIterable {
    case departure = "Вылет из"
    case arrivalCountry = "Страна, город"
    case date = "Даты"
    case numberOfNights = "Кол-во ночей"
    case hotel = "Отель"
    case room = "Номер"
    case nutrition = "Питание"
}

enum NameField: String, CaseIterable {
    case firstName = "Имя"
    case lastName = "Фамилия"
    case dateBirthday = "Дата рождения"
    case nationality = "Гражданство"
    case passportID = "Номер загранпаспорта"
    case validity = "Срок действия загранпаспорта"
}

enum Price: String, CaseIterable {
    case tourPrice = "Тур"
    case fuelCharge = "Топливный сбор"
    case serviceCharge = "Сервисный сбор"
    case pay = "К оплате"
}

struct ExpandableNames {
    var isExpanded = false
    let names = NameField.allCases
}

struct Tourist: Hashable {
    var firstName = ""
    var lastName = ""
    var dateBirthday = ""
    var nationality = ""
    var passportID = ""
    var validity = ""
    
//    static func == (_ firstModel: User, _ secondModel: User ) -> Bool {
//        firstModel.firstName == secondModel.firstName &&
//        firstModel.lastName == secondModel.lastName &&
//        firstModel.additionalName == secondModel.additionalName &&
//        firstModel.gender == secondModel.gender
//    }
}



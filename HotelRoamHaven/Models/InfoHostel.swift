//
//  InfoHostel.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 11.09.2023.
//

import Foundation

struct InfoHostel: Decodable {
    let id: Int
    let hotelName, hotelAdress: String
    let horating: Int
    let ratingName, departure, arrivalCountry, tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice, fuelCharge, serviceCharge: Int
}

//
//  HoroscopeModel.swift
//  TestH
//
//  Created by sherbakova on 11.08.2024.
//

import Foundation

struct Horoscopes: Codable {
    let horoscopes: [Horoscope]
}

struct Horoscope: Codable {
    let sign: String
    let date: String
    let text: String
}

//
//  Sources.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import SwiftUI

let ordinalNumbers = [
    "Первый",
    "Второй",
    "Третий",
    "Четвертый",
    "Пятый",
    "Шестой",
    "Седьмой",
    "Восьмой",
    "Девятый",
    "Десятый"
]

enum Images: String {
    case ratingStar = "RatingStar"
    case blueArrow = "blue arrow"
    case blueArrowUp = "arrow up"
    case blueArrowDown = "arrow down"
    case plus = "plus"
    case emoji = "Party Popper"
    case backArrow
}

class AppColors {
    static let ratingBackground = Color(red: 1, green: 0.78, blue: 0).opacity(0.2)
    static let ratingText = Color(red: 1, green: 0.66, blue: 0)
    static let lightGray = Color(red: 0.51, green: 0.53, blue: 0.59)
    static let backgroundGray = Color(red: 0.96, green: 0.96, blue: 0.98)
    static let almostBlack = Color(red: 0.17, green: 0.19, blue: 0.21)
    static let stroke = Color(red: 0.91, green: 0.91, blue: 0.93)
    static let lightBlue = Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1)
    static let primaryBlue = Color(red: 0.05, green: 0.45, blue: 1)
    static let error = Color(red: 0.93, green: 0.34, blue: 0.34).opacity(0.15)
}

class AppFonts {
    static let rating = Font.custom("SF Pro Display", size: 16).weight(.medium)
    static let title22Medium = Font.custom("SF Pro Display", size: 22).weight(.medium)
    static let title14Medium = Font.custom("SF Pro Display", size: 14).weight(.medium)
    static let title14 = Font.custom("SF Pro Display", size: 14)
    static let minPrice = Font.custom("SF Pro Display", size: 30).weight(.semibold)
    static let title16 = Font.custom("SF Pro Display", size: 16)
    static let title17 = Font.custom("SF Pro Display", size: 17)
    static let title16Medium = Font.custom("SF Pro Display", size: 16).weight(.medium)
    static let title12 = Font.custom("SF Pro Display", size: 12)
}

enum Details: CaseIterable {
    case First, Second, Third
    
    var title: String {
        switch self {
        case .First: return "Удобства"
        case .Second: return "Что включено"
        case .Third: return "Что не включено"
        }
    }
    
    var subTitle: String {
        switch self {
        case .First, .Second, .Third: return "Самое необходимое"
        }
    }
    
    var imageName: String {
        switch self {
        case .First: return "emoji-happy"
        case .Second: return "tick-square"
        case .Third: return "close-square"
        }
    }
}

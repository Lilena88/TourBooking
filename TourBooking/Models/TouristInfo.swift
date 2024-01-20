//
//  TouristInfo.swift
//  TourBooking
//
//  Created by Elena Kim on 1/18/24.
//

import Foundation

class TouristInfo: Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var birthDate: String
    var citizen: String
    var passportNumber: String
    var expDate: String
    var isExpanded: Bool
    
    init(name: String = "", surname: String = "", birthDate: String = "", citizen: String = "", passportNumber: String = "", expDate: String = "", isExpanded: Bool = true) {
        self.name = name
        self.surname = surname
        self.birthDate = birthDate
        self.citizen = citizen
        self.passportNumber = passportNumber
        self.expDate = expDate
        self.isExpanded = isExpanded
    }
}

extension TouristInfo {
    func allPropertiesAreNotEmpty() -> Bool {
        let arr =  Mirror(reflecting: self).children.compactMap { $0.value as? CustomStringConvertible }.map { $0.description}
        if arr.count < 6  {
            return false
        } else {
            return !Mirror(reflecting: self).children.compactMap { $0.value as? CustomStringConvertible }.map { $0.description}.contains{ $0 == ""}
        }
        
    }
}

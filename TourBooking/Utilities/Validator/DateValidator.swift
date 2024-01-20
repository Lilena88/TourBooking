//
//  DateValidator.swift
//  TourBooking
//
//  Created by Elena Kim on 1/19/24.
//

import Foundation

class DateValidator: Validator {
    var title: String
    var validationMask: String
    var placeholder: String
    
    init(title: String, validationMask: String, placeholder: String) {
        self.title = title
        self.validationMask = validationMask
        self.placeholder = placeholder
    }
    
    func validate(newValue: String, for state: inout String) {
        if state.range(of: "^[0-9.]+$", options: .regularExpression) != nil {
            state = String(newValue.prefix(30))
        } else {
            state = ""
        }
    }
     
    func submitAction(state: inout String) -> Bool {
        if state.isEmpty {
            return false
        } else {
            return self.validate(text: state, with: "^[0-9.]+$")
        }
       
    }
    
    
}

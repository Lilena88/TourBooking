//
//  УьфшдМфдшвфещк.swift
//  TourBooking
//
//  Created by Elena Kim on 1/17/24.
//

import Foundation

class EmailValidator: Validator {
    var title: String
    var validationMask: String
    var placeholder: String
    init(title: String, validationMask: String, placeholder: String) {
        self.title = title
        self.validationMask = validationMask
        self.placeholder = placeholder
    }
    
    func validate(newValue: String, for state: inout String) {
    }
    
    func submitAction(state: inout String) -> Bool {
        let trimmedText = state.trimmingCharacters(in: .whitespacesAndNewlines)
        let expression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", expression)
        let isValid = namePredicate.evaluate(with: state)
        return isValid
    }
    
    
}

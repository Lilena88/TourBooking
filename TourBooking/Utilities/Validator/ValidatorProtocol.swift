//
//  ValidatorProtocol.swift
//  TourBooking
//
//  Created by Elena Kim on 1/17/24.
//

import SwiftUI

// Validator for TextFieldValidated
protocol Validator {
    var title: String { get set }
    var validationMask: String { get set }
    var placeholder: String { get set }
    func validate(newValue: String, for state: inout String )
    func submitAction(state: inout String) -> Bool
}

extension Validator {
    func validate(text: String, with regexp: String) -> Bool {
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", regexp)
        let isValid = namePredicate.evaluate(with: text)
        return isValid
    }
    
}

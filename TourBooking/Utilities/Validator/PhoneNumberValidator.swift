//
//  PhoneNumberValidator.swift
//  TourBooking
//
//  Created by Elena Kim on 1/19/24.
//

class PhoneNumberValidator: Validator {
    var title: String
    var validationMask: String
    var placeholder: String
    init(title: String, validationMask: String, placeholder: String) {
        self.title = title
        self.validationMask = validationMask
        self.placeholder = placeholder
    }
    
    func validate(newValue: String, for state: inout String ) {
        guard !newValue.isEmpty else { return }
        if newValue.count > 18 {
            var mask = state.dropLast()
            if let index = mask.firstIndex(of: "*")  {
                let newNumber = String(newValue.suffix(1))
                if "0123456789".contains(newNumber){
                    mask.replaceSubrange(index ... index, with: newNumber)
                }
                if mask != state {
                    state = String(mask)
                }
            } else {
                state = String(mask)
            }
        }
    }
    
    func submitAction(state: inout String) -> Bool {
        if state.contains("*") {
            return false
        }
        return true
    }
    
}

//
//  TextFieldBuilder.swift
//  TourBooking
//
//  Created by Elena Kim on 1/17/24.
//

import SwiftUI

final class TextFieldBuilder {
    static func nameField(name: Binding<String>, showError: Binding<Bool>, isRequired: Bool) -> TextFieldValidated {
        let validator = NameValidator(title: "Имя", validationMask: "", placeholder: "")
        return TextFieldValidated(validator: validator, text: name, showError: showError, isRequired: isRequired)
    }
    static func surnameField(name: Binding<String>, showError: Binding<Bool>, isRequired: Bool) -> TextFieldValidated {
        let validator = NameValidator(title: "Фамилия", validationMask: "", placeholder: "")
        return TextFieldValidated(validator: validator, text: name, showError: showError, isRequired: isRequired)
    }
    
    static func birthDateField(date: Binding<String>, showError: Binding<Bool>, isRequired: Bool) -> TextFieldValidated {
        let validator = DateValidator(title: "Дата рождения", validationMask: "", placeholder: "дд.мм.гггг")
        return TextFieldValidated(validator: validator, text: date, showError: showError, isRequired: isRequired)
    }
    
    static func phoneNumberField(phone: Binding<String>, showError: Binding<Bool>, isRequired: Bool) -> TextFieldValidated {
        let validator = PhoneNumberValidator(title: "Номер телефона", validationMask: "+7 (***) ***-**-**", placeholder: "Номер телефона")
        return TextFieldValidated(validator: validator, text: phone, showError: showError, isRequired: isRequired)
    }
    
    static func emailField(email: Binding<String>, showError: Binding<Bool>, isRequired: Bool) -> TextFieldValidated {
        let validator = EmailValidator(title: "Почта", validationMask: "", placeholder: "examplemail.000@mail.ru")
        return TextFieldValidated(validator: validator, text: email, showError: showError, isRequired: isRequired)
    }
    
    static func citizenField(name: Binding<String>, showError: Binding<Bool>, isRequired: Bool) -> TextFieldValidated {
        let validator = NameValidator(title: "Гражданство", validationMask: "", placeholder: "")
        return TextFieldValidated(validator: validator, text: name, showError: showError, isRequired: isRequired)
    }
    
    static func passportNumerField(name: Binding<String>, showError: Binding<Bool>, isRequired: Bool) -> TextFieldValidated {
        let validator = NameValidator(title: "Номер загранпаспорта", validationMask: "", placeholder: "")
        return TextFieldValidated(validator: validator, text: name, showError: showError, isRequired: isRequired)
    }
    
    static func expDateField(name: Binding<String>, showError: Binding<Bool>, isRequired: Bool) -> TextFieldValidated {
        let validator = DateValidator(title: "Срок действия загранпаспорта", validationMask: "", placeholder: "дд.мм.гггг")
        return TextFieldValidated(validator: validator, text: name, showError: showError, isRequired: isRequired)
    }
   
}

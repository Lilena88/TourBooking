//
//  TextFieldValidated.swift
//  TourBooking
//
//  Created by Elena Kim on 1/16/24.
//

import Combine
import SwiftUI

struct TextFieldValidated: View {
    let validator: Validator
    @Binding var text: String
    @Binding var showError: Bool
    @FocusState private var textFieldFocused: Bool
    @State private var isOn = false
    @State private var isValid = true
    let isRequired: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0)  {
            if isOn || !text.isEmpty {
                Text(validator.title)
                    .font(AppFonts.title12)
                    .foregroundStyle(AppColors.lightGray)
                TextField(validator.placeholder, text: $text)
                    .focused($textFieldFocused)
                    .onChange(of: textFieldFocused) { isFocused in
                        if isFocused {
                            text = validator.validationMask
                        }
                    }
                    .font(AppFonts.title16)
                    .foregroundStyle(Color.black )
                    .onReceive(Just(text)) { newValue in
                        validator.validate(newValue: newValue, for: &text)
                    }
                    .onSubmit {
                        isValid = validator.submitAction(state: &text)
                        isOn = !text.isEmpty
                    }
            } else {
                HStack {
                    Text(validator.title)
                        .font(AppFonts.title17)
                        .foregroundStyle(AppColors.lightGray)
                        .onTapGesture {
                            textFieldFocused = true
                            isOn = true
                        }
                    Spacer()
                }
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .frame(height: 52)
        .background {
            RoundedRectangle(cornerRadius: 10).fill(isValid ? AppColors.backgroundGray : AppColors.error)
        }
        .onChange(of: showError) { oldValue, newValue in
            if isRequired {
                if newValue && text.isEmpty {
                    isValid = false
                }
            } else {
                isValid = true
            }
            
        }
        
    }
    
}

//
//  ButtonFooter.swift
//  TourBooking
//
//  Created by Elena Kim on 1/19/24.
//
import SwiftUI

struct ButtonFooter: View {
    let action: () -> Void
    let title: String
    var body: some View {
        VStack {
            BlueButton(title: title, action: action)
                .padding(.top, 12)
                .padding(.horizontal, 16)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.white)
        .overlay(
            Rectangle()
                .inset(by: -0.5)
                .stroke(Color(red: 0.91, green: 0.91, blue: 0.93), lineWidth: 1)
                .edgesIgnoringSafeArea(.bottom)
        )
    }
}

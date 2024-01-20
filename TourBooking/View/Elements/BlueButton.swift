//
//  BlueButton.swift
//  TourBooking
//
//  Created by Elena Kim on 1/14/24.
//

import SwiftUI

struct BlueButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center) {
                Spacer()
                Text(title)
                    .font(AppFonts.title16Medium)
                    .kerning(0.1)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                Spacer()
            }
            
                
        }
        .frame(minHeight: 48)
        .background(AppColors.primaryBlue)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
    }
}

#Preview {
    BlueButton(title: "К выбору номера") {
        print("Tapped")
    }
}

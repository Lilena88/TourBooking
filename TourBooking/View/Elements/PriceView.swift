//
//  PriceView.swift
//  TourBooking
//
//  Created by Elena Kim on 1/19/24.
//

import SwiftUI

struct PriceView: View {
    let priceNumber: String
    let priceDesc: String
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text(String(priceNumber) + " ₽" )
                .font(AppFonts.minPrice)
            Text(priceDesc)
                .foregroundStyle(AppColors.lightGray)
                .font(AppFonts.title16)
                
        }
    }
}

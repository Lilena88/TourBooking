//
//  HotelBasicInfo.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import SwiftUI

struct HotelBasicInfo: View {
    let hotelInfo: HotelOfferResponse
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                RatingView(ratingText: String(hotelInfo.rating) + " " + hotelInfo.ratingName)
                NameAddressView(name: hotelInfo.name,
                                address: hotelInfo.adress)
            }
            Spacer()
        }
        
    }
    
}

#Preview {
    HotelOffer().environmentObject(vm)
}


struct RatingView: View {
    let ratingText: String
    var body: some View {
        HStack(spacing: 2) {
            Image(Images.ratingStar.rawValue)
            Text(ratingText)
        }
        .foregroundStyle(AppColors.ratingText)
        .font(AppFonts.rating)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(AppColors.ratingBackground)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct NameAddressView: View {
    let name: String
    let address: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .font(AppFonts.title22Medium)
                .foregroundStyle(.black)
            Button(action: {}, label: {
                Text(address)
                    .font(AppFonts.title14Medium)
                    .foregroundStyle(AppColors.primaryBlue)
            })
        }
    }
}



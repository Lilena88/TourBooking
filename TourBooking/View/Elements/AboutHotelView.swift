//
//  AboutHotelView.swift
//  TourBooking
//
//  Created by Elena Kim on 1/14/24.
//

import SwiftUI

struct AboutHotelView: View {
    let hotelDesc: HotelDescription
    
    private let gridItemLayout = [GridItem(.adaptive(minimum: 100))]
    var body: some View {
        VStack {
            let vm = TagsViewModel(tagsString: hotelDesc.peculiarities)
            TagsView(viewModel: vm)
            Text(hotelDesc.description)
                .font(AppFonts.title16)
                .foregroundStyle(.black.opacity(0.9))
        }
    }
    
}

#Preview {
    HotelOffer().environmentObject(vm)
}

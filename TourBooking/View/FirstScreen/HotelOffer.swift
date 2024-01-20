//
//  ContentView.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import SwiftUI

struct HotelOffer: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject var vm: HotelOfferVM
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    OfferDesc(info: vm.hotelOfferResponse)
                    HotelDesc(hotelDescription: vm.hotelOfferResponse.aboutTheHotel)
                }.padding(.bottom, 12)
            }
            .scrollIndicators(.hidden)
            .background(AppColors.backgroundGray)
            ButtonFooter(action: {
                coordinator.roomsTitle = vm.hotelOfferResponse.name
                coordinator.push(.rooms)
            }, title: "К выбору номера")
        }
        .navigationTitle("Отель")
        .toolbarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
    }
}

let networkService = NetworkService(session: URLSession.init(configuration: .default))
let vm = HotelOfferVM(networkService: networkService)

#Preview {
    HotelOffer().environmentObject(vm)
}

struct OfferDesc: View {
    let info: HotelOfferResponse
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ImageCarouselView(imagesUrlStrings: info.imageUrls)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            HotelBasicInfo(hotelInfo: info)
            PriceView(priceNumber: "от" + String(info.minimalPrice), priceDesc: info.priceForIt)
        }
        .padding(.all, 16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


struct HotelDesc: View {
    let hotelDescription: HotelDescription
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Об отеле")
                    .font(AppFonts.title22Medium)
                    .foregroundStyle(.black)
                Spacer()
            }
            AboutHotelView(hotelDesc: hotelDescription)
            VStack {
                ForEach(Details.allCases, id: \.self) { detail in
                    VStack {
                        let needDivider = detail == .Third
                        DetailsRow(
                            title: detail.title,
                            subTitle: detail.subTitle,
                            image: detail.imageName,
                            divider: !needDivider
                        )
                    }
                }
            }
            .padding(.all, 15)
            .background(AppColors.backgroundGray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
        }
        .padding(.all, 16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

//
//  SecondScreen.swift
//  TourBooking
//
//  Created by Elena Kim on 1/15/24.
//

import SwiftUI

struct HotelRooms: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject var vm: HotelRoomsVM
    
    var body: some View {
        List(vm.rooms, id: \.name) { room in
            RoomRow(room: room, action: {
                coordinator.push(.booking)
            })
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                .listRowBackground(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                
        }
        .listStyle(.plain)
        .listRowSpacing(8)
        .scrollIndicators(.hidden)
        .background(AppColors.backgroundGray)
        .configured(with: coordinator.roomsTitle)
    }
}

let ns = NetworkService(session: URLSession.init(configuration: .default))
let hvm = HotelRoomsVM(networkService: ns)
#Preview {
    HotelRooms()
        .environmentObject(hvm)
}

struct RoomRow: View {
    let room: HotelRoom
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageCarouselView(imagesUrlStrings: room.imageUrls)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text(room.name)
                .font(AppFonts.title22Medium)
                .foregroundStyle(.black)
            let vm = TagsViewModel(tagsString: room.peculiarities)
            TagsView(viewModel: vm)
            Button(action: {}, label: {
                HStack(alignment: .center, spacing: 0) {
                    Text("Подробнее о номере")
                        .foregroundStyle(AppColors.primaryBlue)
                    Image(Images.blueArrow.rawValue)
                        .padding(.leading, 10)
                        .padding(.trailing, 8)
                        .padding(.vertical, 6)
                }
                .padding(.leading, 10)
                .padding(.trailing, 2)
                .padding(.vertical, 5)
                .frame(height: 29, alignment: .leading)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(AppColors.lightBlue)
                    
                }
            })
            PriceView(priceNumber: String(room.price), priceDesc: room.pricePer)
                .padding(.top, 8)
            BlueButton(title: "Выбрать номер") {
                action()
            }
            
        }
    }
}

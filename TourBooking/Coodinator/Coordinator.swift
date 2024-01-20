//
//  Coordinator.swift
//  TourBooking
//
//  Created by Elena Kim on 1/19/24.
//

import SwiftUI

enum Page: String, Identifiable {
    case hotel, rooms, booking, finish
    
    var id: String {
        self.rawValue
    }
}


class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var roomsTitle: String = ""
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    
    @ViewBuilder
    func build(page: Page) -> some View {
        let networkService = NetworkService(session: URLSession.init(configuration: .default))
        switch page {
        case .hotel:
            let vm = HotelOfferVM(networkService: networkService)
            HotelOffer()
                .environmentObject(vm)
        case .rooms:
            let vm = HotelRoomsVM(networkService: networkService)
            HotelRooms()
                .environmentObject(vm)
        case .booking:
            let vm = BookingInfoVM(networkService: networkService)
            BookingInfo()
                .environmentObject(vm)
        case .finish:
            FinishScreen()
        }
    }

    
}

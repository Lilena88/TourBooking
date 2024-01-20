//
//  HotelRoomVM.swift
//  TourBooking
//
//  Created by Elena Kim on 1/15/24.
//

import Foundation
import Combine

class HotelRoomsVM: ObservableObject {
    let networkService: NetworkService
    private var cancellable: AnyCancellable?
    
    @Published var rooms: [HotelRoom] = []
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        self.getRooms()
    }
    
    private func getRooms() {
        self.cancellable = networkService.fetchRooms()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Rooms fetch finished")
                case .failure(let networkError):
                    print("Error rooms fetch", networkError)
                }
            } receiveValue: { roomResponse in
                self.rooms = roomResponse.rooms
            }
    }
    
}

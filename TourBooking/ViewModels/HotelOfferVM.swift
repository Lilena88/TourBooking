//
//  HotelOfferVM.swift
//  TourBooking
//
//  Created by Elena Kim on 1/15/24.
//

import Foundation
import Combine

class HotelOfferVM: ObservableObject {
    @Published var hotelOfferResponse: HotelOfferResponse = HotelOfferResponse()
    
    private let networkService: NetworkService
    private var cancellable: AnyCancellable?
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        self.getHotelOffer()
    }
    
    private func getHotelOffer() {
        self.cancellable =  self.networkService.fetchOffer()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished  fetch offer")
                case .failure(let networkError):
                    print("Fetch offer error", networkError)
                }
            } receiveValue: { hotelResponse in
                self.hotelOfferResponse = hotelResponse
            }
    }
    
}

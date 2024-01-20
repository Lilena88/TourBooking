//
//  NetworkService.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import Foundation
import Combine

class NetworkService: BaseNetworkService {
   
    func fetchOffer() -> AnyPublisher<HotelOfferResponse, NetworkError> {
        guard let request = try? URLRequest(url: APIMethod(method: APIMethodPath.offer).asURL()) else {
            return Fail(error: NetworkError.invalidUrl).eraseToAnyPublisher()
        }
        return self.fetchData(request: request)
    }
    
    func fetchRooms() -> AnyPublisher<RoomsResponse, NetworkError> {
        guard let request = try? URLRequest(url: APIMethod(method: APIMethodPath.rooms).asURL()) else {
            return Fail(error: NetworkError.invalidUrl).eraseToAnyPublisher()
        }
        return self.fetchData(request: request)
    }
    
    func fetchTour() -> AnyPublisher<Tour, NetworkError> {
        guard let request = try? URLRequest(url: APIMethod(method: APIMethodPath.booking).asURL()) else {
            return Fail(error: NetworkError.invalidUrl).eraseToAnyPublisher()
        }
        return fetchData(request: request)
    }
    
}

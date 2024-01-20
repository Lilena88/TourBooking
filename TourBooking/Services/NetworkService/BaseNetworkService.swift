//
//  BaseNetworkService.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import Foundation
import Combine

class BaseNetworkService {
    private let urlSession: URLSession
    init(session: URLSession) {
        self.urlSession = session
    }
    
    func fetchData<T: Decodable>(request: URLRequest) -> AnyPublisher<T, NetworkError> {
        return urlSession.dataTaskPublisher(for: request)
            .mapError({ error in NetworkError.requestFailed(error)})
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error in NetworkError.decodingFailed(error)})
            .eraseToAnyPublisher()
    }
}

//
//  APIMethod.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import Foundation

struct APIMethod {
    private let baseURL: String = "https://run.mocky.io/v3/"
    let method: URLPath
    
    init(method: URLPath) {
        self.method = method
    }
    
    
    func asURL() throws -> URL {
        let urlString = baseURL + method.pathString
        guard let url = URL(string: urlString) else { throw NetworkError.invalidUrl }
        return url
    }
}

//
//  NetworkError.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case requestFailed(Error)
    case decodingFailed(Error)
}

//
//  APIMethodPath.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import Foundation

protocol URLPath {
    var pathString: String { get }
}

enum APIMethodPath: URLPath {
    case offer
    case rooms
    case booking
    
    var pathString: String {
        switch self {
        case .offer:
            return "d144777c-a67f-4e35-867a-cacc3b827473"
        case .rooms:
            return "8b532701-709e-4194-a41c-1a903af00195"
        case .booking:
            return "63866c74-d593-432c-af8e-f279d1a8d2ff"
        }
    }
}

//
//  HotelRoom.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import Foundation

struct HotelRoom: Codable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, peculiarities
        case pricePer = "price_per"
        case imageUrls = "image_urls"
    }
}

struct RoomsResponse: Codable {
    let rooms: [HotelRoom]
}

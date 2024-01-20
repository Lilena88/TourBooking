//
//  HotelOfferResponse.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import Foundation

struct HotelOfferResponse: Codable {
    let id: Int
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: HotelDescription
    
    enum CodingKeys: String, CodingKey {
        case id, name, adress, rating
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
    init(id: Int = 0, name: String = "", adress: String = "", minimalPrice: Int = 0, priceForIt: String = "", rating: Int = 0, ratingName: String = "", imageUrls: [String] = [], aboutTheHotel: HotelDescription = HotelDescription(description: "", peculiarities: [])) {
        self.id = id
        self.name = name
        self.adress = adress
        self.minimalPrice = minimalPrice
        self.priceForIt = priceForIt
        self.rating = rating
        self.ratingName = ratingName
        self.imageUrls = imageUrls
        self.aboutTheHotel = aboutTheHotel
    }
}

struct HotelDescription: Codable {
    let description: String
    let peculiarities: [String]
}

//
//  BookingVM.swift
//  TourBooking
//
//  Created by Elena Kim on 1/15/24.
//

import Foundation
import Combine

class BookingInfoVM: ObservableObject {
    @Published var tour: Tour?
    @Published var hotelInfo: HotelOfferResponse = HotelOfferResponse()
    @Published var bookingInfo: [(title: String, info: String)] = []
    @Published var priceInfo: [(title: String, info: String)] = []
    @Published var currentTourist = TouristInfo()
    @Published var mainTourist: TouristInfo = TouristInfo()
    var tourists: [TouristInfo] = [TouristInfo()]
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var showErrors: Bool = false
    @Published var numberTouristsToShow = 1


    let networkService: NetworkService
    private var cancellable: AnyCancellable?
    
    private let titles = [
        "Вылет из",
        "Страна, город",
        "Даты",
        "Кол-во ночей",
        "Отель",
        "Номер",
        "Питание"
    ]
    
    private let priceTitles = [
        "Тур",
        "Топливный сбор",
        "Сервисный сбор",
        "К оплате"
    ]
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        self.getTour()
    }
    
    private func getTour() {
        cancellable = networkService.fetchTour()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Tour finished")
                case .failure(let failure):
                    print("Error tour", failure)
                }
            }, receiveValue: { tour in
                self.tour = tour
                self.hotelInfo = HotelOfferResponse(name: tour.hotelName, adress: tour.hotelAddress, rating: tour.rating, ratingName: tour.ratingName)
                self.getBookingInfo(for: tour)
                self.getPriceInfo(for: tour)
            })
    }
    
    struct BookingInfo {
        let departure: String
        let arrivalCountry: String
        let tourDates: String
        let numberOfNights: Int
        let hotelName: String
        let room: String
        let nutrition: String
        
    }
    
    private func getBookingInfo(for tour: Tour) {
        let bookingInfo = BookingInfo(
            departure: tour.departure,
            arrivalCountry: tour.arrivalCountry,
            tourDates: tour.tourDateStart + "-" + tour.tourDateStop,
            numberOfNights: tour.numberOfNights,
            hotelName: tour.hotelName,
            room: tour.room,
            nutrition: tour.nutrition)
        var propertiesArray = Mirror(reflecting: bookingInfo).children
            .compactMap { $0.value as? CustomStringConvertible }
            .map { $0.description }
        for (index, element) in propertiesArray.enumerated() {
            self.bookingInfo.append((self.titles[index], element))
        }
    }
    
    struct PriceInfo {
        let tourPrice: Int
        let fuelCharge: Int
        let serviceCharge: Int
        var payment: Int {
            return tourPrice + fuelCharge + serviceCharge
        }
        
    }
    
    private func getPriceInfo(for tour: Tour) {
        let priceInfo = PriceInfo(tourPrice: tour.tourPrice, fuelCharge: tour.fuelCharge, serviceCharge: tour.serviceCharge)
        let propertiesArray = Mirror(reflecting: priceInfo).children
            .compactMap { $0.value as? CustomStringConvertible}
            .map { $0.description }
        for (index, element) in propertiesArray.enumerated() {
            self.priceInfo.append((self.priceTitles[index], element + " ₽"))
        }
        self.priceInfo.append((self.priceTitles.last ?? "", String(priceInfo.payment) + " ₽"))
    }
    
    func checkAll() {
        if email.isEmpty || phoneNumber.isEmpty {
            //show that something is empty
            showErrors = true
         
        } else if !checkTourists() {
            // show what fields are empty
            showErrors = true
        } else {
            // go to end
            showErrors = false
        }
    }
    
    func checkTourists() -> Bool {
        if tourists.isEmpty {
            tourists.append(currentTourist)
        }
        guard let firstTourist = tourists.first else { return false }
        return firstTourist.allPropertiesAreNotEmpty()
        
    }
    
    func addNewTourist() {
        tourists.append(TouristInfo())
        self.numberTouristsToShow += 1
        
    }
    
    func showError() {
        
    }
}

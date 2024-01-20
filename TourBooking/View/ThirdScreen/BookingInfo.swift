//
//  ThirdScreen.swift
//  TourBooking
//
//  Created by Elena Kim on 1/15/24.
//

import SwiftUI
import Combine

struct BookingInfo: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject var vm: BookingInfoVM
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    HotelBasicInfo(hotelInfo: vm.hotelInfo)
                        .padding(.all, 16)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                        }
                    
                    InfoBlock(bookingInfo: vm.bookingInfo, isTrailingAlign: false)
                    ClientInfoBlock(phoneNumber: $vm.phoneNumber, email: $vm.email, showError: $vm.showErrors)
                    
                    ForEach(0 ..< vm.numberTouristsToShow, id: \.self) { index in
                        if index == 0 {
                            TouristInfoBlock(touristInfo: $vm.tourists[index], showError: $vm.showErrors, isRequired: true, ordinalNumber: ordinalNumbers[index])
                        } else {
                            TouristInfoBlock(touristInfo: $vm.tourists[index], showError: $vm.showErrors, isRequired: false, ordinalNumber: ordinalNumbers[index])
                        }
                        
                    }
                    AddTouristBlock {
                        vm.addNewTourist()
                    }
                    InfoBlock(bookingInfo: vm.priceInfo, isTrailingAlign: true)
                    
                }.padding(.bottom, 10)
            }.scrollIndicators(.hidden)
                .background(AppColors.backgroundGray)
            ButtonFooter(action: {
                vm.checkAll()
                if vm.showErrors == false {
                    coordinator.push(.finish)
                }
            }, title: "Оплатить" + " \(vm.priceInfo.last?.info ?? "")")
        }
        .configured(with: "Бронирование")
    }
    
}


let n = NetworkService(session: URLSession.init(configuration: .default))
let hm = BookingInfoVM(networkService: ns)
#Preview {
    BookingInfo()
        .environmentObject(hm)
}

struct InfoBlock: View {
    let bookingInfo: [(title: String, info: String)]
    let isTrailingAlign: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(bookingInfo, id: \.title) { row in
                HStack(alignment: .center, spacing: 0, content: {
                    Text(row.title)
                        .font(AppFonts.title16)
                        .foregroundStyle(AppColors.lightGray)
                        .frame(width: 140, alignment: .leading)
                    if isTrailingAlign {
                        Spacer()
                    }
                    Text(row.info)
                        .font(AppFonts.title16)
                        .foregroundStyle(Color.black)
                    if !isTrailingAlign {
                        Spacer()
                    }
                })
            }
        }.padding(.all, 16)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
            }
    }
    
}

struct ClientInfoBlock: View {
    @Binding var phoneNumber: String
    @Binding var email: String
    @Binding var showError: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Информация о покупателе")
                .font(AppFonts.title22Medium)
                .foregroundStyle(Color.black)
            VStack(alignment: .center, spacing: 8) {
                TextFieldBuilder.phoneNumberField(phone: $phoneNumber, showError: $showError, isRequired: true)
                TextFieldBuilder.emailField(email: $email, showError: $showError, isRequired: true)
                Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                    .font(AppFonts.title14)
                    .foregroundColor(AppColors.lightGray)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
        }
    }
}


struct TouristInfoBlock: View {
    @Binding var touristInfo: TouristInfo
    @State private var isExpanded: Bool = true
    @Binding var showError: Bool
    let isRequired: Bool
    let ordinalNumber: String
    
    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                VStack(alignment: .center, spacing: 8) {
                    TextFieldBuilder.nameField(name: $touristInfo.name, showError: $showError, isRequired: isRequired)
                    TextFieldBuilder.surnameField(name: $touristInfo.surname, showError: $showError, isRequired: isRequired)
                    TextFieldBuilder.birthDateField(date: $touristInfo.birthDate, showError: $showError, isRequired: isRequired)
                    TextFieldBuilder.citizenField(name: $touristInfo.citizen, showError: $showError, isRequired: isRequired)
                    TextFieldBuilder.passportNumerField(name: $touristInfo.passportNumber, showError: $showError, isRequired: isRequired)
                    TextFieldBuilder.expDateField(name: $touristInfo.expDate, showError: $showError, isRequired: isRequired)
                    
                }
            },
            label: { Text(ordinalNumber + " турист ")
                    .font(AppFonts.title22Medium)
                    .foregroundStyle(Color.black)
            }
        ).disclosureGroupStyle(CustomDisclosureGroupStyle())
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
            }
    }
    
}

struct AddTouristBlock: View {
    let addAction: () -> Void
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Text("Добавить туриста")
                .font(AppFonts.title22Medium)
                .foregroundStyle(.black)
            Spacer()
            Button(action: { addAction() }, label: {
                Image(Images.plus.rawValue)
                    .padding(.all, 4)
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(AppColors.primaryBlue)
                    }
            })
        }
        .frame(height: 32)
        .padding(.horizontal, 16)
        .padding(.vertical, 13)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        }
    }
}

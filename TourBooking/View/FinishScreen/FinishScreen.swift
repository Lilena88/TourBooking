//
//  FinishScreen.swift
//  TourBooking
//
//  Created by Elena Kim on 1/18/24.
//

import SwiftUI
import Combine

struct FinishScreen: View {
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        Spacer()
        VStack(spacing: 20) {
            Image(Images.emoji.rawValue)
                .padding(25)
                .background {
                    RoundedRectangle(cornerRadius: 47).fill(AppColors.backgroundGray)
            }
            Text("Ваш заказ принят в работу")
                .font(AppFonts.title22Medium)
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
                .padding(.top, 12)
                
            Text("Подтверждение заказа №\(String(Int.random(in: 10000...20000))) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .font(AppFonts.title16)
              .multilineTextAlignment(.center)
              .foregroundColor(AppColors.lightGray)

        }.padding(.horizontal, 23)
        Spacer()
            
        ButtonFooter(action: {
            coordinator.popToRoot()
        }, title: "Супер!")
        .configured(with: "Заказ оплачен")
    }
   
}


#Preview {
    FinishScreen()
}

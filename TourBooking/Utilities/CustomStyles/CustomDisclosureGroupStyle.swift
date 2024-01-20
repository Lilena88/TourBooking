//
//  CustomDisclosureGroupStyle.swift
//  TourBooking
//
//  Created by Elena Kim on 1/17/24.
//

import SwiftUI

struct CustomDisclosureGroupStyle: DisclosureGroupStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            HStack {
                configuration.label
                Spacer()
                Image(configuration.isExpanded ? Images.blueArrowUp.rawValue : Images.blueArrowDown.rawValue)
                    .padding(.horizontal, 8)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(AppColors.lightBlue)
                    }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    configuration.isExpanded.toggle()
                }
            }
            if configuration.isExpanded {
                configuration.content
                    .padding(.top, 20)
                    .disclosureGroupStyle(self)
            }
        }
    }
    
}

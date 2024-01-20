//
//  DetailsRow.swift
//  TourBooking
//
//  Created by Elena Kim on 1/14/24.
//


import SwiftUI

struct DetailsRow: View {
    let title: String
    let subTitle: String
    let image: String
    var divider: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Image(image)
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(AppFonts.title16Medium)
                            .foregroundStyle(AppColors.almostBlack)
                        Text(subTitle)
                            .font(AppFonts.title14Medium)
                            .foregroundStyle(AppColors.lightGray)
                    }
                    Spacer()
                    Image("arrow")
                }
                if divider {
                    Divider()
                }
            }

        }
    }
}

let title = "Удобства"
let subTitle = "Самое необходимое"
let image = "emoji-happy"

#Preview {
    DetailsRow(title: title, subTitle: subTitle, image: image, divider: true)
}

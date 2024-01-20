//
//  TagsView.swift
//  TourBooking
//
//  Created by Elena Kim on 1/14/24.
//

import SwiftUI

struct Tag: Identifiable, Hashable{
    var id = UUID().uuidString
    var name: String
    var size: CGFloat = 0
}

struct TagsView: View {
    @StateObject var viewModel: TagsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(viewModel.rows, id:\.self) { rows in
                HStack(spacing: 8){
                    ForEach(rows){ row in
                        Text(row.name)
                            .font(AppFonts.title16Medium)
                            .foregroundStyle(AppColors.lightGray)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(AppColors.backgroundGray)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .lineLimit(1)
                        
                    }
                    Spacer()
                }
            }
        }
    }
}

let tags = [
    "XCode",
    "IOS",
    "IOS App Development"
]
let ViewModel = TagsViewModel(tagsString: tags)

#Preview {
    TagsView(viewModel: ViewModel)
}


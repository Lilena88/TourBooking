//
//  ImageCarouselView.swift
//  TourBooking
//
//  Created by Elena Kim on 1/13/24.
//

import SwiftUI

struct ImageCarouselView: View {
    let imagesUrlStrings: [String]
    
    @State private var currentIndex = 0
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(0 ..< imagesUrlStrings.count, id: \.self) { index in
                    AsyncImage(url: URL(string: imagesUrlStrings[index])) { image in
                        image
                            .resizable()
                            .scaledToFill()
                        
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(alignment: .bottom) {
                DotsView(numberOfPages: self.imagesUrlStrings.count, currentIndex: currentIndex)
            }
        }
        .frame(height: 257)
    }
    
    
    
}

struct DotsView: View {
    let numberOfPages: Int
    let currentIndex: Int
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 5) {
            ForEach(0 ..< numberOfPages, id: \.self) { index in
                let color = colorWithOpacity(for: index)
                Capsule()
                    .fill(color)
                    .frame(width: 7, height: 7)
            }
        }.padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5, style: .circular))
            .padding([.bottom], 8)
    }
    
    private func colorWithOpacity(for index: Int) -> Color {
        var opacity: Double
        if index > self.currentIndex {
            opacity = 1 - Double(index - currentIndex )/Double(numberOfPages) - 0.5
        } else if index < currentIndex {
            opacity = 1 - Double(currentIndex - index)/Double(numberOfPages) - 0.5
        } else {
            return Color.black
        }
        if opacity < 0.05 {
            opacity = 0.05
        }
        return Color.black.opacity(opacity)
    }
}

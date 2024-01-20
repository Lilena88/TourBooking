//
//  NavigationBarModifier.swift
//  TourBooking
//
//  Created by Elena Kim on 1/20/24.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    let title: String
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .toolbarTitleDisplayMode(.inline)
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarBackButtonHidden()
            .toolbar{ BackToolbar() }
    }
}

extension View {
    func configured(with title: String = "Title") -> some View {
        self.modifier(NavigationBarModifier(title: title))
    }
}

struct BackToolbar: ToolbarContent {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(Images.backArrow.rawValue)
            })
            
        }
    }
}

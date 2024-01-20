//
//  CoodinatorView.swift
//  TourBooking
//
//  Created by Elena Kim on 1/19/24.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .hotel)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                        .onAppear {
                            UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "arrow.backward")

                            UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")

                        }
                }
        }
        .environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}

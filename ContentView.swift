//
//  ContentView.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 07/05/1445 AH.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var auth = AuthService.shared
    
    @State var didSplash: Bool = false
    @State var didOnboard: Bool = false
    
    var body: some View {
        if didSplash {
            if didOnboard {
                if auth.loggedIn {
                    MainView()
                } else {
                    LoginView()
                }
            } else {
                OnboardingView(didOnboard: $didOnboard)
            }
        } else {
            SplashView(didSplash: $didSplash)
        }
    }
}

#Preview {
    ContentView()
}

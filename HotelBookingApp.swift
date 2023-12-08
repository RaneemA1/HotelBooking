//
//  HotelBookingApp.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 07/05/1445 AH.
//

import SwiftUI

@main
struct HotelBookingApp: App {
    
    
    @ObservedObject var auth = AuthService.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(auth.isDarkMode ? .dark : .light)
        }
    }
}

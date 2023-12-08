//
//  ProfileViewViewModel.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 24/05/1445 AH.
//

import SwiftUI

class ProfileViewViewModel: ObservableObject {
    func logout() {
        Task {
            AuthService.shared.user = nil
            AuthService.shared.loggedIn = false
            AuthService.shared.token = ""
        }
    }
}

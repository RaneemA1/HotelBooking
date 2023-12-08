//
//  LoginViewViewModel.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 24/05/1445 AH.
//

import SwiftUI


class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var gender: String = "Male"
    
    @Published var networking: Bool = false
    
    
    @MainActor
    func login() {
        Task {
            do {
                networking = true
                let (uid, token) = try await SupabaseHelper.signIn(email: email, password: password)
                
                let result: [User] = try await SupabaseHelper.read(tableName: "User", column: "uid", value: uid)
                
                AuthService.shared.token = token
                AuthService.shared.user = result.first
                AuthService.shared.loggedIn = true
                networking = false
            } catch {
                networking = false
                print(error)
            }
            
        }
    }
    
    @MainActor
    func guest() {
        Task {
            do {
                //let token = try await SupabaseHelper.signInAnonymously()
                //AuthService.shared.token = token
                AuthService.shared.loggedIn = true
            } catch {
                print(error)
            }
            
        }
    }
}

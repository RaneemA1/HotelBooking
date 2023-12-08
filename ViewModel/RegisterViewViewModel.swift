//
//  RegisterViewViewModel.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 24/05/1445 AH.
//

import SwiftUI

class RegisterViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var dob: Date = Date()
    @Published var gender: String = "Male"
    
    @Published var networking: Bool = false
    
    
    @MainActor
   func signUp() {
        Task {
            do {
                networking = true
                let (uid, token) = try await SupabaseHelper.signUp(email: email, password: password)
                
                // create User file in Supabase
                let user = User(name: name, uid: uid, dob: dob, gender: gender, email: email, mobile: "")
                
                try await SupabaseHelper.create(object: user, tableName: "User")
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
    
    
}

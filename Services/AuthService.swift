//
//  AuthService.swift
//  Sahil
//
//  Created by ٍٍRaneem A on 18/05/1445 AH.
//

import Foundation

final class AuthService: ObservableObject {
    
    static let shared = AuthService()
    
    @Published var user: User? = nil
    var token: String = ""
    
    @Published var loggedIn: Bool = false
    @Published var isDarkMode: Bool = false
   
}

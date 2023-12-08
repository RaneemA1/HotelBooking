//
//  Login.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 21/05/1445 AH.
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

struct LoginView: View {
    
    @StateObject private var vm = LoginViewViewModel()
   
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Logo1()
                
                Text("Let's get you Login!")
                    .bold()
                    .font(.custom("SpaceGrotesk-semibold", size: 30))
                    .padding(.top, 18)
                
                Text("Enter your information beiow ")
                    .foregroundColor(.gray)
                    .font(Font.custom("Space Grotesk", size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                    .padding(.top, 18)
                
                HStack {
                    Button(action: {}) {
                        HStack {
                            Image("googleIcon")
                                .resizable()
                                .frame(width: 20, height: 20)

                            Text("Google")
                                .font(Font.custom("Space Grotesk", size: 16))
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray2, lineWidth: 1)
                        }
                    }
                    
                    Button(action: {}) {
                        HStack {
                            Image("facebook")
                                .resizable()
                                .frame(width: 10, height: 20)
                            Text("facebook")
                                .font(Font.custom("Space Grotesk", size: 16))
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray2, lineWidth: 1)
                        }
                    }
                    
                }
                .padding(.top, 18)
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    Text("Or login with")
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                }
                .padding(.top, 18)
                
                CustomTextField(title: "Email Address", text: $vm.email)
                    .padding(.top, 18)
                CustomSecureTextField(title: "Password", text: $vm.password)
                    .padding(.top, 18)
                
                HStack {
                    Spacer()
                    Button("Forgot Password?", action: {})
                        .foregroundColor(.blue2)
                }
                
                
                Button(action: { vm.login() }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(Color.blue2)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }
                .padding(.top, 18)
                
                Button(action: { vm.guest() }) {
                    Text("Continue as guest")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(Color.blue2)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }
                .padding(.top, 12)
                
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Don't have an account?")
                    NavigationLink("Register Now") {
                        
                        RegisterView()
                    }
                    .foregroundColor(.blue2)
                    Spacer()
                }
                
            }
            .padding(.horizontal)
            .disabled(vm.networking)
        }
    }
    
  
}

#Preview {
    LoginView()
}

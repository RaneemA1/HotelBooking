//
//  RegisterView.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 21/05/1445 AH.
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

struct RegisterView: View {
    
    @StateObject private var vm = RegisterViewViewModel()
    @Environment(\.dismiss) private var dismiss
    

    var body: some View {
        VStack(alignment: .leading) {
            Logo1()
            
            Text("Register Now!")
                .bold()
                .font(.custom("SpaceGrotesk-semibold", size: 30))
                .padding(.top, 18)
            
            Text("Enter your information beiow ")
                .foregroundColor(.gray)
                .font(Font.custom("Space Grotesk", size: 15))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                .padding(.top, 18)
                        .padding(.top, 18)
            
            CustomTextField(title: "Name", text: $vm.name)
                .padding(.top, 18)
            CustomTextField(title: "Email Address", text: $vm.email)
                .padding(.top, 18)
            CustomSecureTextField(title: "Password", text: $vm.password)
                .padding(.top, 18)
            CustomDatePicker(text: "Date of Birth", date: $vm.dob)
                .padding(.top, 18)
                
            CustomPicker(selectedItem: $vm.gender, items: ["Male", "Female"])
                .padding(.top, 18)
                
                Spacer()
            Button(action: { vm.signUp() }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color.blue2)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Already a member?")
                Button("Login", action :{
                    dismiss()
                })
                .foregroundColor(.blue2)
                Spacer()
            }
        }
        .disabled(vm.networking)
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
    

}

#Preview {
    RegisterView()
}

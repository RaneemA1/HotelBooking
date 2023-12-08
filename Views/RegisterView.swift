//
//  RegisterView.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 21/05/1445 AH.
//

import SwiftUI

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

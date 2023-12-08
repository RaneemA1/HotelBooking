//
//  EditProfile.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 21/05/1445 AH.
//

import SwiftUI
import PhotosUI

class EditProfileViewViewModel: ObservableObject {
    @Published var imageItem: PhotosPickerItem?
    @Published var image: Image?
    
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobile: String = ""
    @Published var dob: Date = Date()
    
    @Published var gender: String = "Male"
    
    @Published var networking: Bool = false
    
    
    
    
     func update() {
        Task {
            guard let user = AuthService.shared.user else { return }
            
            networking = true
            
            var updatedUser = User(name: name, uid: user.uid, dob: dob, gender: gender, email: email, mobile: mobile)
            updatedUser.id = user.id
            try await SupabaseHelper.update(object: updatedUser, tableName: "User", id: user.id)
            
            networking = false
        }
    }
    
}

struct EditProfile: View {
    @StateObject private var vm = EditProfileViewViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var auth = AuthService.shared
    
   
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
                PhotosPicker(selection: $vm.imageItem, matching: .images) {
                    if let image = vm.image {
                        // show user image
                        image
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.blue2, lineWidth: 2)
                            }
                    } else {
                        Image(systemName:"person.fill")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.blue2, lineWidth: 2)
                            }
                    }
                }
                .onChange(of: vm.imageItem) { oldValue, newValue in
                    Task {
                        if let data = try? await vm.imageItem?.loadTransferable(type: Data.self) {
                            if let uiImage = UIImage(data: data) {
                                vm.image = Image(uiImage: uiImage)
                                return
                            }
                        }
                    }
                }
                
                Spacer()
            }
            
            CustomTextField(title: "Name", text: $vm.name)
                .padding(.top, 18)
            CustomTextField(title: "Email Address", text: $vm.email)
                .padding(.top, 18)
            CustomTextField(title: "Mobile Number", text: $vm.mobile)
                .padding(.top, 18)
            CustomDatePicker(text: "Date of Birth", date: $vm.dob)
                .padding(.top, 18)
            CustomPicker(selectedItem: $vm.gender, items: ["Male", "Female"])
                .padding(.top, 18)
            Spacer()
            Button(action: { vm.update() }) {
                Text("Update")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color.blue2)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                
            }
            
            
        }
        .disabled(vm.networking)
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)

                        .flipsForRightToLeftLayoutDirection(true)
                }
            }
        }
        .padding()
        .onAppear {
            print(auth.user)
            if let user = auth.user {
                vm.name = user.name
                vm.email = user.email
                vm.dob = user.dob
                vm.mobile = user.mobile
                vm.gender = user.gender
            }
        }
    }
    
   
    
    
}
#Preview {
    NavigationStack {
        EditProfile()
    }
    
}

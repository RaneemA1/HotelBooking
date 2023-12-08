//
//  Profile.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 22/05/1445 AH.
//

import SwiftUI


struct ProfileView: View {
    @StateObject private var vm = ProfileViewViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var auth = AuthService.shared
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                
                if let user = auth.user {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(verbatim: user.email)
                            .font(.caption2)
                            .foregroundStyle(.white)
                    }
                } else {
                    VStack(alignment: .leading) {
                        Text("Guest")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
                
                
                Spacer()
                Button(action: {}) {
                    Image("edit1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                }
                
            }
            .padding()
            .background {
                Color.blue2
                    .cornerRadius(22)
                    .ignoresSafeArea()
            }
            List {
                if auth.user != nil {
                    listRow(title: "Edit Profile", imageName: "edit") {
                        EditProfileView()
                        
                    }
                    
                    listRow(title: "Payment Method", imageName: "payment") {
                     
                         AddCardTopayView()
                    }
                    listRow(title: "My Bookings", imageName: "booking") {
               
                             DetailsBookingUserView()
                    }
                }
                
                HStack(spacing: 16) {
                    Image(colorScheme == .dark ? "theme_dark" : "theme_light")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                    Toggle("Dark Mode", isOn: $auth.isDarkMode)
                }
                .padding(.vertical, 12)
                
                listRow(title: "Privacy Policy", imageName: "privacy") {
                    PrivacyPolicyView()
                }
                listRow(title: "Terms & Conditions", imageName: "terms") {
                    TermsConditionsView()
                }
                
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack(spacing: 16) {
                        Image(systemName: "globe")
                            .resizable()
                            .fontWeight(.thin)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26, height: 26)
                        Text("Change Language")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .flipsForRightToLeftLayoutDirection(true)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 12)
                
                
                
            }
            .listStyle(.plain)
            
            Button(action: { vm.logout() }) {
                Text("Logout")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color.blue2)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal)
        }
        .navigationTitle("My Profile")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            
        }
    }
    
    private func listRow(title: LocalizedStringKey, imageName: String, destination: () -> some View) -> some View {
        NavigationLink {
            destination()
        } label: {
            HStack(spacing: 16) {
                Image(colorScheme == .dark ? "\(imageName)_dark" : "\(imageName)_light")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                Text(title)
                Spacer()
                //                Image(systemName: "chevron.right")
            }
            .padding(.vertical, 12)
        }
    }
    
    
}


#Preview {
    NavigationStack {
        ProfileView()
    }
    
}

//
//  MainView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 24/05/1445 AH.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack{
            TabView{
                HomeView(data: FileBase())
                    .tabItem {
                        Label(" ", systemImage: "house")
                    }
                SearchAllHotel()
                    .tabItem {
                        Label(" ", systemImage: "magnifyingglass")
                    }
                ProfileView()
                    .tabItem {
                        Label(" ", systemImage: "person")
                    }
            }
        }
    }
}

#Preview {
    MainView()
}

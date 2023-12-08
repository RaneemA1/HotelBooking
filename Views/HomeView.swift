//
//  ContentView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @StateObject var data : FileBase
    @State var city: City?
    @State var hotel: HotelsDetail?
  
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 10.0){
                
                VStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.blue2)
                            .edgesIgnoringSafeArea(.top)
                            .frame(maxWidth: .infinity)
                            .frame(height: 8*13)
                            .overlay{
                                VStack(spacing: 30.0) {
                                    HStack{
                                        CircleButton() // For Profile
                                        Spacer()
                                        Logo()
                                            .padding(.trailing , 40)
                                            .font(.largeTitle)
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    
                                }
                                
                            }
                    }
                    
                }
                
                ScrollView(showsIndicators: false){
                    
                    VStack{
                        
                        AddingCity(data: FileBase())
                        
                        SeeAllFavoriteView()
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
    
            
    }
}

#Preview {
    HomeView(data: FileBase())
}

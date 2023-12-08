//
//  BestHotelsView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 08/05/1445 AH.
//

import SwiftUI

struct BestHotelsView: View {
    @ObservedObject var data: FileBase
  
    var body: some View {
       
            VStack{
                HStack{
                    Text("Best Hotels")
                        .foregroundColor(.black2)
                        .font(.title2)
                        .bold()
                    Spacer()
                    NavigationLink {
                        AllBestHotelsView(data: FileBase())
                    } label: {
                        Text("See All")
                            .foregroundColor(.blue2)
                    }
                }.padding(.bottom)
                
             ScrollView(.horizontal , showsIndicators: false) {
                 
                 HStack{
                     ForEach(data.fullRateHotel){ full in
                         
                         NavigationLink {
                             SelectedHotelView(
                                 hotelname:full.hotelDetails1.hotelName,
                                 hotelImage:full.hotelDetails1.hotelImage,
                                 hotelCity: full.hotelDetails1.hotelLocation,
                                 description: full.hotelDetails1.descriptions)
                         } label: {
                             
                             RoundedRectangle(cornerRadius: 12)
                                 .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                             
                                 .frame(width: 8*29 , height: 8*34)
                                 .overlay{
                                     VStack(alignment: .leading) {
                                         AsyncImage(url: full.hotelDetails1.hotelImage){image in
                                             image
                                                 .resizable()
                                             
                                                 .frame(width:8*25 , height: 8*16)
                                                 .clipShape(RoundedRectangle(cornerRadius: 16))
                                         }placeholder: {
                                             ProgressView()
                                         }
                                         
                                         HStack {
                                             HStack(spacing: 2.0){
                                                 Image(systemName: "star.fill")
                                                 Image(systemName: "star.fill")
                                                 Image(systemName: "star.fill")
                                                 Image(systemName: "star.fill")
                                                 Image(systemName: "star.fill")
                                                 
                                             }.foregroundColor(.yellowStars)
                                             Text("5.0")
                                                 .foregroundColor(.gray2)
                                                 .bold()
                                         }
                                         Text(full.hotelDetails1.hotelName)
                                             .bold()
                                         HStack{
                                             Image(systemName: "mappin.and.ellipse")
                                             Text(full.hotelDetails1.hotelLocation)
                                             
                                             
                                         } .foregroundColor(.gray2)
                                         Text("$ \(Int(full.hotelDetails1.price)) /night")
                                             .bold()
                                     }
                                 }
                         }
                     }.foregroundColor(.black2)
                      
                 }
                 
                 
            }
                
            }.padding(.horizontal)
        }
    
}

#Preview {
    BestHotelsView(data: FileBase())
}

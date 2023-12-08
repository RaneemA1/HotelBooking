//
//  AllBestHotelsView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 08/05/1445 AH.
//

import SwiftUI

struct AllBestHotelsView: View {
    @ObservedObject var data: FileBase

    var body: some View {
          
         NavigationStack {
            
            VStack{
                HeaderView( title: "Favorite")
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading){
                        ForEach(data.fullRateHotel){ full in
                        NavigationLink {
                            SelectedHotelView(
                                hotelname:full.hotelDetails1.hotelName,
                                hotelImage:full.hotelDetails1.hotelImage,
                                hotelCity: full.hotelDetails1.hotelLocation,
                                description: full.hotelDetails1.descriptions)
                        } label: {
                            VStack {
                             
                                   
                                       RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                                       
                                        .frame( height: 8*21)
                                        .overlay{
                                            HStack {
                                                AsyncImage(url: full.hotelDetails1.hotelImage){image in
                                                    image
                                                        .resizable()
                                                    
                                                        .frame(width:8*20 , height: 8*17)
                                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                                }placeholder: {
                                                    ProgressView()
                                                }
                                                VStack(alignment: .leading){
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
                                }
                                 
                            }
                        }.foregroundColor(.black2)

                        
                     
                    }
                    
                }
            }
//            .navigationTitle("Favorite Hotels")
//            .navigationBarTitleDisplayMode(.inline)
        }.padding()
//            .searchable(text: $data.searchForHotel , placement: .automatic ,prompt: Text("Search For Hotel") )
//          
            
        }
        
    
    
    
//        func searchHotel (_ search: String , _ hotelNames: [AllCities])->[AllCities]{
//            
//            if search.isEmpty {
//                return data.fullRateHotel
//            }else{
//                
//                return hotelNames.filter{ $0.hotelDetails1.hotelName.localizedCaseInsensitiveContains(search)}
//            }
//        }
    }


#Preview {
    AllBestHotelsView(data: FileBase())
}

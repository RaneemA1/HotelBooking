//
//  NearByLocationView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 08/05/1445 AH.
//

import SwiftUI

struct SeeAllFavoriteView: View {
 
    @Environment(\.locale) var locale
    
    @StateObject var favoriteHotelVM = FavoriteViewModel()
    
    var body: some View {
       
        VStack{
            HStack{
               
                Text( NSLocalizedString("Best Hotels", comment:"Best Hotels"))
                    .foregroundColor(.black2)
                    .font(.title2)
                    .bold()
                Spacer()
                NavigationLink {
                    FavoriteView()
                } label: {
                   
                    Text( NSLocalizedString("See All", comment:"See All"))
                        .foregroundColor(.blue2)
                }
            }.padding(.bottom)
            
            
           
                VStack{
                    
                    ForEach(favoriteHotelVM.favoriteHotels.prefix(4).indices, id: \.self) { index in
                        let enHotelName =  favoriteHotelVM.favoriteHotels[index].en_hotel_name
                        let hotelImage = favoriteHotelVM.favoriteHotels[index].hotel_image
                        let enAddress = favoriteHotelVM.favoriteHotels[index].en_address
                        let enDescription = favoriteHotelVM.favoriteHotels[index].en_description
                        let enPrice = favoriteHotelVM.favoriteHotels[index].en_price
                        
                        let arHotelName = favoriteHotelVM.favoriteHotels[index].ar_hotel_name
                        let arAddress = favoriteHotelVM.favoriteHotels[index].ar_address
                        let arDescription = favoriteHotelVM.favoriteHotels[index].ar_description
                        
                        NavigationLink {
                            SelectedHotelView(
                                hotelname: locale.language.languageCode?.identifier == "en" ? enHotelName : arHotelName,
                                hotelImage: hotelImage,
                                hotelCity: locale.language.languageCode?.identifier == "en" ? enAddress : arAddress,
                                description: locale.language.languageCode?.identifier == "en" ? enDescription : arDescription
                            )
                        } label: {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                                .frame(maxWidth: .infinity)
                                .frame(height: 8*20)
                                .overlay{
                                    HStack {
                                        AsyncImage(url: favoriteHotelVM.favoriteHotels[index].hotel_image) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 8*18 , height: 8*16)
                                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        VStack(alignment: .leading){
                                            HStack {
                    
                    HStack {
                        HStack(spacing: 2.0){
                            let starNum = favoriteHotelVM.favoriteHotels[index].rating
                            ForEach(0..<Int(starNum)){ _ in
                                Image(systemName: "star.fill")
                            }
                        }.foregroundColor(.yellowStars)
                        Text(" \(favoriteHotelVM.favoriteHotels[index].rating).0")
                            .foregroundColor(.gray2)
                            .bold()
                    }
                                            }
                                            Text(locale.language.languageCode?.identifier == "en" ? enHotelName : arHotelName)
                                                .bold()
                                            HStack {
                                                Image(systemName: "mappin.and.ellipse")
                                                Text(locale.language.languageCode?.identifier == "en" ? favoriteHotelVM.favoriteHotels[index].en_city :favoriteHotelVM.favoriteHotels[index].ar_city )
                                            }.foregroundColor(.gray2)
                    
                                            // let price = (locale.language.languageCode?.identifier == "en" ? Int(enPrice) : Int(arPrice))
                                            let currency = NSLocalizedString("$", comment:"dolar")
                                            let night = NSLocalizedString("night", comment:"night")
                                            Text("\(currency) \(Int(enPrice)) / \(night)")
                                                .font(.footnote)
                                            // .bold()
                                        }.frame(maxWidth: .infinity)
                                    }.padding(.horizontal)
                                }
                        }.navigationBarBackButtonHidden(true)
                    }
                    
                    
                    
                    
                }.foregroundColor(.black2)
            
        }.padding()
                 
       
        }
    
}

#Preview {
    SeeAllFavoriteView()
}



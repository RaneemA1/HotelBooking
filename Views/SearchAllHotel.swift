//
//  SearchAllHotel.swift
//  HotelBooking
//
//  Created by Reem Alammari on 24/05/1445 AH.
//

import SwiftUI

struct SearchAllHotel: View {
    @Environment(\.locale) var locale
    
    @StateObject var hotelVM = HotelViewModel()

    var body: some View {

        NavigationStack{
            
            ScrollView(showsIndicators: false) {
               
                    VStack{
                        
                        SearchBar(text: $hotelVM.searchText)
                        
                        if ( hotelVM.searchText.isEmpty){
                            VStack(spacing: 50.0){
                              
                                Text(  NSLocalizedString("You can Search for All Hotels", comment:""))
                                    .font(.title2)
                                    .foregroundColor(.gray2)
                                    .padding(.top, 40)
                                
                                HStack(spacing: 4.0) {
                                 Image(systemName: "m.circle.fill")
                                        .font(.largeTitle)
                                  
                                    Text(NSLocalizedString("MrHotel", comment:""))
                                        .font(.title2)
                                        
                                } .foregroundColor(.gray2)
                                  
                            }
                        }else {
                        ForEach( hotelVM.filteredHotels.indices , id: \.self) { index in
                            let enHotelName =  hotelVM.filteredHotels[index].en_hotel_name
                            let hotelImage = hotelVM.filteredHotels[index].hotel_image
                            let enHotelCity = hotelVM.filteredHotels[index].en_address
                            let enDescription = hotelVM.filteredHotels[index].en_description
                            let enPrice = hotelVM.filteredHotels[index].en_price
                            
                            let arHotelName = hotelVM.filteredHotels[index].ar_hotel_name
                            let arHotelCity = hotelVM.filteredHotels[index].ar_address
                            let arDescription = hotelVM.filteredHotels[index].ar_description
                            
                            
                            NavigationLink {
                                
                                
                                
                                SelectedHotelView(hotelname:locale.language.languageCode?.identifier == "en" ? enHotelName : arHotelName,
                                                  hotelImage: hotelImage,
                                                  hotelCity: locale.language.languageCode?.identifier == "en" ? enHotelCity : arHotelCity ,
                                                  description: locale.language.languageCode?.identifier == "en" ? enDescription : arDescription )
                                
                                
                            } label: {
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                                    .frame(maxWidth: .infinity)
                                    .frame( height: 8*20)
                                    .overlay{
                                        HStack {
                                            AsyncImage(url: hotelImage) {image in
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width:8*18 , height: 8*16)
                                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            
                                            VStack(alignment: .leading){
                                                HStack {// here must be define rate
                                                    HStack(spacing: 2.0){
                                                        let starNum = hotelVM.filteredHotels[index].rating
                                                        ForEach(0..<Int(starNum)){ _ in
                                                            Image(systemName: "star.fill")
                                                        }
                                                    }.foregroundColor(.yellowStars)
                                                    Text(" \(hotelVM.filteredHotels[index].rating).0")
                                                        .foregroundColor(.gray2)
                                                        .bold()
                                                }
                                                Text(locale.language.languageCode?.identifier == "en" ?  enHotelName :  arHotelName)
                                                    .bold()
                                                HStack{
                                                    Image(systemName: "mappin.and.ellipse")
                                                    Text(locale.language.languageCode?.identifier == "en" ?  hotelVM.filteredHotels[index].en_city :  hotelVM.filteredHotels[index].ar_city
                                                    )
                                                    
                                                    
                                                } .foregroundColor(.gray2)
                                                
                                                let currency = NSLocalizedString("$", comment:"dolar")
                                                let night = NSLocalizedString("night", comment:"night")
                                                Text("\(currency) \(Int(enPrice)) / \(night)")
                                                    .font(.footnote)
                                                // .bold()
                                            }.frame(maxWidth: .infinity)
                                        }.padding(.horizontal)
                                    }
                            }.navigationBarBackButtonHidden(true)
                        }.foregroundColor(.black2)
                        
                        
                        
                        
                    }
                }
                }.padding()
                
            
        }
    }
    
}

#Preview {
    SearchAllHotel()
}

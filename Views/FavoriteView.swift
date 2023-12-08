//
//  SeeAllNearByLocation.swift
//  HotelBooking
//
//  Created by Reem Alammari on 08/05/1445 AH.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.locale) var locale
    
    @StateObject var favoriteHotelVM = FavoriteViewModel()
  
    @State var searchText: String = ""
    var body: some View {

        NavigationStack{
            
            ScrollView(showsIndicators: false) {
                VStack {
                    HeaderView()
                        .padding(.bottom)
                    VStack{
                     
                        ForEach(favoriteHotelVM.favoriteHotels.indices, id: \.self) { index in
                            let enHotelName =  favoriteHotelVM.favoriteHotels[index].en_hotel_name
                            let hotelImage = favoriteHotelVM.favoriteHotels[index].hotel_image
                            let enHotelCity = favoriteHotelVM.favoriteHotels[index].en_city
                            let enDescription = favoriteHotelVM.favoriteHotels[index].en_description
                            let enPrice = favoriteHotelVM.favoriteHotels[index].en_price
                            
                            let arHotelName = favoriteHotelVM.favoriteHotels[index].ar_hotel_name
                            let arHotelCity = favoriteHotelVM.favoriteHotels[index].ar_city
                            let arDescription = favoriteHotelVM.favoriteHotels[index].ar_description
                            
                            NavigationLink {
                                
                                
                                SelectedHotelView(hotelname:locale.language.languageCode?.identifier == "en" ? enHotelName : arHotelName,
                                                  hotelImage: hotelImage,
                                                  hotelCity: locale.language.languageCode?.identifier == "en" ? enHotelCity : arHotelCity ,
                                                  description: locale.language.languageCode?.identifier == "en" ? enDescription : arDescription)
                                
                                
                            } label: {
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                                    .frame(maxWidth: .infinity)
                                    .frame( height: 8*20)
                                    .overlay{
                                        HStack {
                                            AsyncImage(url: favoriteHotelVM.favoriteHotels[index].hotel_image) {image in
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
                                                        let starNum = favoriteHotelVM.favoriteHotels[index].rating
                                                        ForEach(0..<Int(starNum)){ _ in
                                                            Image(systemName: "star.fill")
                                                        }
                                                    }.foregroundColor(.yellowStars)
                                                    Text("         \(favoriteHotelVM.favoriteHotels[index].rating).0")
                                                        .foregroundColor(.gray2)
                                                        .bold()
                                                }
                                                Text(locale.language.languageCode?.identifier == "en" ?  enHotelName :  arHotelName)
                                                    .bold()
                                                HStack{
                                                    Image(systemName: "mappin.and.ellipse")
                                                    Text(locale.language.languageCode?.identifier == "en" ?  enHotelCity :  arHotelCity
                                                    )
                                                    
                                                    
                                                } .foregroundColor(.gray2)
                                               
                                                let currency = NSLocalizedString("$", comment:"dolar")
                                                let night = NSLocalizedString("night", comment:"night")
                                                Text("\(currency) \(Int(enPrice)) / \(night)")
                                                    .font(.footnote)
                                              
                                            }.frame(maxWidth: .infinity)
                                        }.padding(.horizontal)
                                    }
                            }.navigationBarBackButtonHidden(true)
                        }
                        
                   //-------------------
                        
                        
                    }.foregroundColor(.black2)
                }
                
            }.padding()
        }
    }
    
}



#Preview {
    FavoriteView()
}

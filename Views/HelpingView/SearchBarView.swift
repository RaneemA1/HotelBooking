//
//  CustomSearchView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 07/05/1445 AH.
//

import SwiftUI

 
 
 struct SearchBarView: View {
     @Environment(\.locale) var locale
     @Binding var searchForHotel: String
     @ObservedObject var favoriteHotelVM = FavoriteViewModel()

     var body: some View {
         VStack {
             HStack {
                 Image(systemName: "magnifyingglass")
                     .foregroundColor(searchForHotel.isEmpty ? Color.gray2 : Color.white)
               
                 TextField(NSLocalizedString("Search For Hotel", comment:"Search For Hotel"), text: $searchForHotel)
                     .foregroundColor(.black2.opacity(0.5))
                     .disableAutocorrection(true)

                 if !searchForHotel.isEmpty {
                     Button(action: {
                         self.searchForHotel = ""
                     }) {
                         Image(systemName: "xmark.circle.fill")
                             .padding()
                             .foregroundColor(.white)
                             .font(.title2)
                     }
                     .accessibilityLabel("Close")
                 }
             }.padding(.horizontal)
             .font(.headline)
             .padding()
             .background(
                 RoundedRectangle(cornerRadius: 12.0)
                     .fill(.white.opacity(0.2))
                     .frame(height: 40)
                     .frame(maxWidth: .infinity)
                 
             )
             ScrollView{
                 if(!searchForHotel.isEmpty){
                     ForEach(filteredFavoriteHotels.indices, id: \.self) { index in
                         let enHotelName =  filteredFavoriteHotels[index].en_hotel_name
                         //  let hotelImage = favoriteHotelVM.favoriteHotels[index].hotel_image
                         let enHotelCity = filteredFavoriteHotels[index].en_city
                       //  let enDescription = filteredFavoriteHotels[index].en_description
                         let enPrice = filteredFavoriteHotels[index].en_price
                         
                         let arHotelName = filteredFavoriteHotels[index].ar_hotel_name
                         let arHotelCity = filteredFavoriteHotels[index].ar_city
                        // let arDescription = filteredFavoriteHotels[index].ar_description
                         
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                             .frame(maxWidth: .infinity)
                             .frame( height: 8*20)
                             .overlay{
                                 HStack {
                                     AsyncImage(url: filteredFavoriteHotels[index].hotel_image) {image in
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
                                                 let starNum = filteredFavoriteHotels[index].rating
                                                 ForEach(0..<Int(starNum)){ _ in
                                                     Image(systemName: "star.fill")
                                                 }
                                             }.foregroundColor(.yellowStars)
                                             Text("  \(filteredFavoriteHotels[index].rating).0")
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
                     }
                 }
             }
           
         }
     }

     var filteredFavoriteHotels: [FavoriteHotel] {
         if searchForHotel.isEmpty {
             return favoriteHotelVM.favoriteHotels
         } else {
             return favoriteHotelVM.favoriteHotels.filter { hotel in
                 hotel.ar_hotel_name.localizedCaseInsensitiveContains(searchForHotel) ||
                 hotel.en_hotel_name.localizedCaseInsensitiveContains(searchForHotel) ||
                 hotel.ar_city.localizedCaseInsensitiveContains(searchForHotel)
                     ||
                 hotel.en_city.localizedCaseInsensitiveContains(searchForHotel)
             }
         }
     }
 }

 struct SearchBarView_Previews: PreviewProvider {
     static var previews: some View {
         SearchBarView(searchForHotel: .constant(""))
             .previewLayout(.sizeThatFits)
             .preferredColorScheme(.light)

         SearchBarView(searchForHotel: .constant(""))
             .previewLayout(.sizeThatFits)
             .preferredColorScheme(.dark)
     }
 }

 
 
  

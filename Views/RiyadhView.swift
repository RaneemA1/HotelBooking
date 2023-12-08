//
//  HotelsForCity.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//

import SwiftUI

struct RiyadhView : View {
    @Environment(\.locale) var locale
    
    @StateObject var riyadhHotelVM = RiyadhViewModel()

    var hotels : Array<HotelsDetail> = []
    var hotelsToCity : Array<City> = []
    @State var searchText: String = ""
    var body: some View {

        NavigationStack{
            
            ScrollView(showsIndicators: false) {
                VStack {
                    HeaderView()
                        .padding(.bottom)
                    VStack{
                     
                        ForEach(riyadhHotelVM.riyadhHotels.indices , id: \.self) { index in
                            let enHotelName =  riyadhHotelVM.riyadhHotels[index].en_hotel_name
                            let hotelImage = riyadhHotelVM.riyadhHotels[index].hotel_image
                            let enHotelCity = riyadhHotelVM.riyadhHotels[index].en_address
                            let enDescription = riyadhHotelVM.riyadhHotels[index].en_description
                            let enPrice = riyadhHotelVM.riyadhHotels[index].en_price
                            
                            let arHotelName =  riyadhHotelVM.riyadhHotels[index].ar_hotel_name
                            let arHotelCity = riyadhHotelVM.riyadhHotels[index].ar_address
                            let arDescription = riyadhHotelVM.riyadhHotels[index].ar_description
                            let price  = riyadhHotelVM.riyadhHotels[index].en_price
                            
                            NavigationLink {
                           
                                
                                
                                SelectedHotelView(hotelname:locale.language.languageCode?.identifier == "en" ? enHotelName : arHotelName,
                                                  hotelImage: hotelImage,
                                                  hotelCity: locale.language.languageCode?.identifier == "en" ? enHotelCity : arHotelCity ,
                                                  price: locale.language.languageCode?.identifier == "en" ? price : price, description: locale.language.languageCode?.identifier == "en" ? enDescription : arDescription)
                                
                                
                          } label: {
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                                    .frame(maxWidth: .infinity)
                                    .frame( height: 8*20)
                                    .overlay{
                                        HStack {
                                            AsyncImage(url: riyadhHotelVM.riyadhHotels[index].hotel_image) {image in
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
                                                        let starNum = riyadhHotelVM.riyadhHotels[index].rating
                                                        ForEach(0..<Int(starNum)){ _ in
                                                            Image(systemName: "star.fill")
                                                        }
                                                    }.foregroundColor(.yellowStars)
                                                    Text("         \(riyadhHotelVM.riyadhHotels[index].rating).0")
                                                        .foregroundColor(.gray2)
                                                        .bold()
                                                }
                                                Text(locale.language.languageCode?.identifier == "en" ?  enHotelName :  arHotelName)
                                                    .bold()
                                                HStack{
                                                    Image(systemName: "mappin.and.ellipse")
                                                    Text(locale.language.languageCode?.identifier == "en" ?  riyadhHotelVM.riyadhHotels[index].en_city :  riyadhHotelVM.riyadhHotels[index].ar_city
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
                        
                    }.foregroundColor(.black2)
                }
                
            }.padding()
        }
    }
    
}


#Preview {
    RiyadhView()
}

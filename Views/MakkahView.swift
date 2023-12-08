//
//  MakkahView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 23/05/1445 AH.
//

import SwiftUI

struct MakkahView: View {
    @Environment(\.locale) var locale
    
    @StateObject var makkahHotelVM = MakkahViewModel()
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
                        
                       // if
                        ForEach(makkahHotelVM.makkahHotels.indices, id: \.self) { index in
                            let enHotelName =  makkahHotelVM.makkahHotels[index].en_hotel_name
                            let hotelImage = makkahHotelVM.makkahHotels[index].hotel_image
                            let enHotelCity = makkahHotelVM.makkahHotels[index].en_address
                            let enDescription = makkahHotelVM.makkahHotels[index].en_description
                            let price = makkahHotelVM.makkahHotels[index].en_price
                            
                            let arHotelName = makkahHotelVM.makkahHotels[index].ar_hotel_name
                            let arHotelCity = makkahHotelVM.makkahHotels[index].ar_address
                            let arDescription = makkahHotelVM.makkahHotels[index].ar_description
                            
                            NavigationLink {
                                
                                
                                SelectedHotelView(hotelname:
                                                locale.language.languageCode?.identifier == "en" ? enHotelName : arHotelName,
                                                  hotelImage: hotelImage,
                                                  hotelCity: locale.language.languageCode?.identifier == "en" ? enHotelCity : arHotelCity ,
                                                  description: locale.language.languageCode?.identifier == "en" ? enDescription : arDescription)
                                
                                //locale.language.languageCode?.identifier == "en" ? price : price,
                            } label: {
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                                    .frame(maxWidth: .infinity)
                                    .frame( height: 8*20)
                                    .overlay{
                                        HStack {
                                            AsyncImage(url: makkahHotelVM.makkahHotels[index].hotel_image) {image in
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
                                                        let starNum = makkahHotelVM.makkahHotels[index].rating
                                                        ForEach(0..<Int(starNum)){ _ in
                                                            Image(systemName: "star.fill")
                                                        }
                                                    }.foregroundColor(.yellowStars)
                                                    Text("         \(makkahHotelVM.makkahHotels[index].rating).0")
                                                        .foregroundColor(.gray2)
                                                        .bold()
                                                }
                                                Text(locale.language.languageCode?.identifier == "en" ?  enHotelName :  arHotelName)
                                                    .bold()
                                                HStack{
                                                    Image(systemName: "mappin.and.ellipse")
                                                    Text(locale.language.languageCode?.identifier == "en" ?  makkahHotelVM.makkahHotels[index].en_city :  makkahHotelVM.makkahHotels[index].ar_city
                                                    )
                                                    
                                                    
                                                } .foregroundColor(.gray2)
                                               
                                                let currency = NSLocalizedString("$", comment:"dolar")
                                                let night = NSLocalizedString("night", comment:"night")
                                                Text("\(currency) \(Int(price)) / \(night)")
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
    MakkahView()
}

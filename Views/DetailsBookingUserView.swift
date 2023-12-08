//
//  BookingUser.swift
//  HotelBooking
//
//  Created by Reem Alammari on 23/05/1445 AH.
//

import SwiftUI

struct DetailsBookingUserView: View {
    @Environment(\.locale) var locale
    @ObservedObject var bookingVM = BookingViewModel()
    var body: some View {
        
        
        VStack {
            
            Text(NSLocalizedString("Your Booking Details", comment:""))
                .font(.title2)
                .foregroundColor(.black2)
                .underline()
                .padding(.top)
            ScrollView {
                ForEach(bookingVM.booked.indices, id: \.self){ index in
                    let enHotelName =  bookingVM.booked[index].en_hotel_name
                    let hotelImage = bookingVM.booked[index].hotel_image
                    let enHotelAddress = bookingVM.booked[index].en_city
                    let interval = bookingVM.booked[index].interval_date
                    let arHotelName =  bookingVM.booked[index].ar_hotel_name
                    let arHotelAddress = bookingVM.booked[index].ar_city
                    let price  = bookingVM.booked[index].en_price
                    let adult = bookingVM.booked[index].adult
                    let child = bookingVM.booked[index].children
                    // let infant = bookingVM.booked[index].infant
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray2.opacity(0.4) , lineWidth: 1.0)
                    
                        .frame( height: 8*21)
                        .overlay{
                            HStack {
                                AsyncImage(url: hotelImage){image in
                                    image
                                        .resizable()
                                    
                                        .frame(width:8*18 , height: 8*16)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                }placeholder: {
                                    ProgressView()
                                }
                                VStack(alignment: .leading, spacing: 10.0){
                                    
//                                    Text(locale.language.languageCode?.identifier == "en" ? enHotelName : arHotelName)
//                                        .bold()
//                                    HStack{
//                                        Image(systemName: "mappin.and.ellipse")
//                                        Text(locale.language.languageCode?.identifier == "en" ? enHotelAddress : arHotelAddress )
//                                        
//                                        
//                                    }
//                                    .foregroundColor(.gray2)
//                                    
//                                    Text("\(interval) ")
//                                    
//                                    Text( NSLocalizedString("adult:", comment:"") + " \(adult) |" + NSLocalizedString("children:", comment:""), +"\(child)")
//                                        .foregroundColor(.black2.opacity(0.5))
//                                    
//                                    Text( NSLocalizedString("Price:", comment:"Price:") + " \(price)")
                                }
                                .foregroundColor(.black2)
                                    .font(.title3)
                                    .padding(.horizontal)
                            }
                            
                        }
                }
            }
        }
    }
}

#Preview {
    DetailsBookingUserView()
}

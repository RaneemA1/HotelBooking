//
//  DetailsAndPayView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 10/05/1445 AH.
//

import SwiftUI

struct DetailsAndPayView: View {
    var hotelName: String = ""
    var hotelImage: URL?
    var location: String = ""
    var adult: Int = 0
    var children: Int = 0
    var intervalDate: String
    var adultsNum: Int = 0
    var childrenNum: Int = 0
    var price: Float = 0.0
    var body: some View {
        
        NavigationStack {
            VStack{
                 HeaderView(title: "Confirm And Pay")
                 
                 ScrollView {
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
                                 VStack(alignment: .leading){
                                    
                                     Text(hotelName)
                                         .bold()
                                     HStack{
                                         Image(systemName: "mappin.and.ellipse")
                                         Text(location)
                                         
                                         
                                     } .foregroundColor(.gray2)
                                   
                                     Text("\(intervalDate) ")
                                     
                                         Text("adult: \(adult) | children:  \(children)")
                                         .foregroundColor(.black2.opacity(0.5))
                                     
                                     
                                 }.foregroundColor(.black2)
                                  .padding(.horizontal)
                                  .frame(maxWidth: .infinity)
                             }
                                
                         }
                     //----------------------------------------------
                     VStack(alignment: .leading, spacing: 20.0) {
                         Text("Your Booking Details")
                         
                         Text("Dates: \(intervalDate)")
                         
                         Text("Guests:  adult\(adult) ,children: \(childrenNum)")
                         
                         Divider()
                         
                         Text("Choose how to pay")
                            
                         PaymentWaysView()
                            
                         Divider()
                         
                         HStack {
                             Text("Total Price:")
                             Spacer()
                             Text("\(Int(price))")
                         }
                         
                         
                  
                     }.font(.title3)
                      .foregroundColor(.black2)
                      .bold()
                    
                     
                 }
          
                NavigationLink {
                   SuccessfulPayingView()
                } label: {
                    Text("Pay Now")
                        .foregroundColor(.white)
                        .background(
                        RoundedRectangle(cornerRadius: 12)
                            .frame(maxWidth: .infinity)
                            .frame(width: 365 ,height: 50)
                            .foregroundColor(.blue2)
                        )
            }
                     
            }.padding()
             
        }
    }
}

#Preview {
    DetailsAndPayView( intervalDate: "")
}

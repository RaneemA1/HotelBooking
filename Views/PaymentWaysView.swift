//
//  test.swift
//  HotelBooking
//
//  Created by Reem Alammari on 10/05/1445 AH.
//

import SwiftUI

struct PaymentWaysView: View {
       @State private var paymentWays = ["Pay Now", "Pay Later"]
       @State private var selectedItem: String?

       var body: some View {
           VStack(spacing: 40.0) {
               ForEach(paymentWays, id: \.self) { title in
                   HStack{
                       Text(title)
                           .frame(maxWidth: .infinity, alignment: .leading)
                       
                       Button {
                           if selectedItem == title {
                               selectedItem = nil
                           } else {
                               selectedItem = title
                           }
                       } label: {
                           Image(systemName: selectedItem == title ? "circle.fill" : "circle")
                               .font(.footnote)
                               .foregroundColor(.blue2.opacity(0.8))
                               .overlay{
                                   Image(systemName: "circle")
                                       .font(.title2)
                                       .foregroundColor(.blue2.opacity(0.8))
                               }
                       }
                   }
                   if selectedItem == title && paymentWays[0] == title {
                       PayNowView()
                   } else if selectedItem == title {
                       PayLaterView()
                   }
               }
           }.padding()
          
       }
   }



#Preview {
    PaymentWaysView()
}


/*
 if paymentWays[0] == title {
    PayNowView()
    
 } else {
    PayLaterView()
 }
 */

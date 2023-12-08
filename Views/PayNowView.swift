//
//  PayNowView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 12/05/1445 AH.
//

import SwiftUI

struct PayNowView: View {
    @State var isShwingSheet: Bool = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30.0) {
                
                Text("Payment Method")
                    .foregroundColor(.black2)
                    .font(.title3)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.top)
                    .bold()
                HStack{
                    
                    Button(action: {
                        isShwingSheet.toggle()
                    }
                           , label: {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray2, lineWidth: 1.0)
                            .frame(width: 70, height: 40)
                            .overlay{
                                Image("visa")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40)
                            }
                    })
                    
                  
                    Button(action: {
                        isShwingSheet.toggle()
                    }
                           , label: {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray2, lineWidth: 1.0)
                            .frame(width: 70, height: 40)
                            .overlay{
                                Image("oo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                            }
                    })
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray2, lineWidth: 1.0)
                        .frame(width: 70, height: 40)
                        .overlay{
                            Image("paypal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 30)
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray2, lineWidth: 1.0)
                        .frame(width: 70, height: 40)
                        .overlay{
                            HStack(spacing: 2.0){
                                Image("applepay")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 40)
                                Text("Pay")
                            }
                        }
                }
            }
        }.sheet(isPresented: $isShwingSheet , content: {
            VStack(alignment: .leading) {
               
               AddCardTopayView()
                
            }
        })
    }
}

#Preview {
    PayNowView()
}

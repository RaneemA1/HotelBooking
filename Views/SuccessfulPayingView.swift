//
//  SaccessfulPayingView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 11/05/1445 AH.
//

import SwiftUI
import Lottie


struct SuccessfulPayingView: View {
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20.0) {
               
                Circle()
                    .frame(width: 100)
                    .foregroundColor(.blue2.opacity(0.2))
                    .overlay{
                        Circle()
                            .frame(width: 70)
                            .foregroundColor(.blue2)
                            .overlay{
                                Image(systemName: "checkmark.circle")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                            }
                    }
                LottieView {
                    await .loadedFrom(url: URL(string: "https://lottie.host/1e4a3c64-a6ee-4ea0-8b6d-a7dc4ad74962/qEER8hsQIG.json")!)
                }
                    .frame(width: 100 , height: 100)
                 
                
                
                VStack{
                    Text( NSLocalizedString("Payment received", comment:"Payment received"))
                    Text(NSLocalizedString("Successfully", comment:"Successfully"))
                   
                }.foregroundColor(.black2)
                    .bold()
                
                VStack{
                    
                    Text(NSLocalizedString("Congratulations🎉", comment:"Congratulations🎉"))
                   
                    Text( NSLocalizedString("Your booking has beeb confirmed", comment:""))
                   
                }.foregroundColor(.black2.opacity(0.7))
                    .padding(.bottom)
                NavigationLink {
                    HomeView(data: FileBase())
                } label: {
                    
                    Text(NSLocalizedString("Back to Home", comment:""))
                 
                        .foregroundColor(.white)
                        .background(
                        RoundedRectangle(cornerRadius: 12)
                            .frame(maxWidth: .infinity)
                            .frame(width: 365 ,height: 50)
                            .foregroundColor(.blue2)
                        )
                }

               
            }
        }
    }
}

#Preview {
    SuccessfulPayingView()
}

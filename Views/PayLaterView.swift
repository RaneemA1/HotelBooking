//
//  PayLaterView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 12/05/1445 AH.
//

import SwiftUI

struct PayLaterView: View {
    @State var isShwingSheet: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 30.0){
               
                    Text("Add The Card Information To Insure Booking")
                  .foregroundColor(.black2)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                Button {
                    isShwingSheet.toggle()
                } label: {
                    ButtonsForSelectedView(text: "Add")
                }.frame(maxWidth: .infinity ,alignment: .center)
                    .padding(.top)
                    

            }
        }.sheet(isPresented: $isShwingSheet , content: {
            VStack(alignment: .leading) {
               
               AddCardTopayView()
                
            }
        })
    }
}

#Preview {
    PayLaterView()
}

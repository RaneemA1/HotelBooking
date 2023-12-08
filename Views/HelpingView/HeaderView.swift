//
//  HeaderView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 10/05/1445 AH.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.dismiss) var dismiss
    var title: String = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                
            }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        HStack{
                            Button(action: {
                                dismiss()
                               }
                                   , label: {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.black2)
                              })
                            .navigationBarBackButtonHidden(true)
                           
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                           
                            
                            Text(title)
                                .foregroundColor(.black2)
                                .bold()
                            Spacer()
                        }
                    }
                
            }
        }
    }
}

#Preview {
    HeaderView()
}

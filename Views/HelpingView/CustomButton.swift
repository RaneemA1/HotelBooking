//
//  ButtonSelect.swift
//  HotelBooking
//
//  Created by Reem Alammari on 10/05/1445 AH.
//

import SwiftUI

struct CustomButton: View {
    @Environment(\.presentationMode) var presentationMode
    var text: String = "Select"
    var body: some View {
        VStack {
//            Button {
//                presentationMode.wrappedValue.dismiss()
//            } label: {
                Text(text)
                    .foregroundColor(.white)
                    .background(
                    RoundedRectangle(cornerRadius: 12)
                        .frame(maxWidth: .infinity)
                        .frame(width: 365 ,height: 50)
                        .foregroundColor(.blue2)
                    )
   //     }
        }.padding()
    }
}

#Preview {
    CustomButton()
}

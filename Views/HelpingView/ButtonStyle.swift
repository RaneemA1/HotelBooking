//
//  ButtonStyle.swift
//  HotelBooking
//
//  Created by Reem Alammari on 24/05/1445 AH.
//

import SwiftUI

struct ButtonStyle: View {
    var text: String = "Select"
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .background(
            RoundedRectangle(cornerRadius: 12)
                .frame(maxWidth: .infinity)
                .frame(width: 365 ,height: 50)
                .foregroundColor(.blue2)
            )
    }
}

#Preview {
    ButtonStyle()
}

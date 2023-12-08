//
//  ButtonsForSelectedView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 10/05/1445 AH.
//

import SwiftUI

struct ButtonsForSelectedView: View {
    var text: String = ""
    var body: some View {
        Text(text)
            .foregroundColor(.blue2)
            .background(
                RoundedRectangle(cornerRadius: 12.0)
                    .stroke(Color.blue2, lineWidth: 1.0)
                    .frame(width: 8*15 , height: 40)
                    .foregroundColor(.blue2)
            )
    }
}

#Preview {
    ButtonsForSelectedView()
}

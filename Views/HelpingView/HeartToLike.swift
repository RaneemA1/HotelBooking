//
//  HeartToLike.swift
//  HotelBooking
//
//  Created by Reem Alammari on 10/05/1445 AH.
//

import SwiftUI

struct HeartToLike: View {
    @State var isFillHeart: Bool = false
    var body: some View {
        Button {
            isFillHeart.toggle()
        } label: {
            Image(systemName: isFillHeart ? "heart.fill" : "heart")
                .foregroundColor(.whiteForSheet)
                .font(.title)
        }

    }
}

#Preview {
    HeartToLike()
}

//
//  CircleButton.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//

import SwiftUI

struct CircleButton: View {
    var body: some View {
        Button {
            //ProfileView()
        } label: {
            VStack(spacing: 4) {
                HStack(spacing: 4.0){
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(height: 12)
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(height: 12)
                }
                HStack(spacing: 4.0){
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(height: 12)
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(height: 12)
                }
            }.foregroundColor(.white)
        }

    }
}

#Preview {
    CircleButton()
}

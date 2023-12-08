//
//  Logo1.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 12/05/1445 AH.
//

import SwiftUI

struct Logo1: View {
    var body: some View {
        HStack(spacing: 4.0){
            Image(systemName:"m.circle.fill")
                .font(.largeTitle)
            Text("MrHotel")
                .font(.title2)
        }.foregroundColor(.blue2)
    }}
#Preview {
    Logo1()
}

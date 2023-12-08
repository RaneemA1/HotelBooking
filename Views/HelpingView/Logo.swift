//
//  Logo.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        
        
        HStack(spacing: 4.0) {
         Image(systemName: "m.circle.fill")
               
                .font(.largeTitle)
            Text("MrHotel")
                .font(.title2)
            
        } .foregroundColor(.white)
    }
}

#Preview {
    Logo()
}

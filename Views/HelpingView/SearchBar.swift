//
//  SearchBar.swift
//  HotelBooking
//
//  Created by Reem Alammari on 24/05/1445 AH.
//

import SwiftUI
struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            
            TextField(NSLocalizedString("Search", comment:"Search"), text: $text)
                .padding(8)
                .background(.gray2.opacity(0.3))
                .cornerRadius(12)

            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.gray2)
                    .padding(8)
            }
            .opacity(text.isEmpty ? 0 : 1)
        }
        .padding(8)
    }
}



//#Preview {
//    SearchBar()
//}

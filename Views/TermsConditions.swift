//
//  TermsConditions.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 21/05/1445 AH.
//

import SwiftUI

struct TermsConditions: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Last update 10/12/2023")
                .foregroundColor(.gray2)
            Text("Please read these terms of service, carefully before using our app operated by us.")
            Text("Conditions of Uses")
                .foregroundColor(.blue2)
            Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
            Spacer()
        }
        .navigationTitle("Terms & Conditions")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .flipsForRightToLeftLayoutDirection(true)
                }
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        TermsConditions()
    }
}

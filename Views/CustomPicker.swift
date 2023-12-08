//
//  CustomPicker.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 22/05/1445 AH.
//

import SwiftUI

struct CustomPicker: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedItem: String
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gender")
                .font(.headline)
            
            ForEach(items, id: \.self) { item in
                HStack {
                    Button(action: {
                        withAnimation {
                            selectedItem = item
                        }
                    }) {
                        HStack {
                            if  selectedItem == item {
                                Circle()
                                    .stroke(.blue2, lineWidth: 1)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Circle()
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(.blue2)
                                    }
                            } else {
                                Circle()
                                    .stroke(.gray, lineWidth: 1)
                                    .frame(width: 20, height: 20)
                            }
                            
                            Text(LocalizedStringKey(item))
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    CustomPicker(selectedItem: .constant("Male"), items: ["Male", "Female"])
}

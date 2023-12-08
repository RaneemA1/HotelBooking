//
//  CustomDatePicker.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 22/05/1445 AH.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Environment(\.colorScheme) var colorScheme
    @FocusState var focus: Bool
    
    @State private var isFocused: Bool = false
    
    let text: String
    @Binding var date: Date
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Text(text.isEmpty ? text : "")
                .font(isFocused ? .caption : .headline)
                .offset(x: 0, y: isFocused ? -12 : 0)

            DatePicker("Date", selection: $date, displayedComponents: .date)
                .font(.headline)
            
        }
        .frame(height: 57)
            .padding(.horizontal)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .cornerRadius(8)
            .overlay(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? Color.blue2 : Color.blue2, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
            .onTapGesture {
                focus.toggle()
            }
    }
}

#Preview {
    VStack {
        CustomDatePicker(text: "Date of Birth", date: .constant(Date()))
    }
    .padding()
    
}

//
//  CustomTextField.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 22/05/1445 AH.
//

import SwiftUI

struct CustomTextField: View {
    
    @Environment(\.colorScheme) var colorScheme
    @FocusState var focus: Bool
    
    @State private var isFocused: Bool = false
    
    let title: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(text.isEmpty ? title : "")
                .font(isFocused ? .caption : .headline)
                .offset(x: 0, y: isFocused ? -12 : 0)

            TextField("", text: $text)
                .textFieldStyle(.plain)
                .focused($focus)
                .offset(x: 0, y: isFocused ? 5 : 0)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .onChange(of: focus) { oldValue, newValue in
                    withAnimation {
                        isFocused = newValue
                    }
                }
            
        }
        
        .frame(height: 57)
            .padding(.horizontal)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .cornerRadius(8)
            .overlay(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? Color.blue : Color.blue2, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
            .onTapGesture {
                focus.toggle()
            }
    }
}

#Preview {
    VStack {
        CustomTextField(title: "Email", text: .constant(""))
    }
    .padding()
    
}

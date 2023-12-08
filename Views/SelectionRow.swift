//
//  SelectionRow.swift
//  HotelBooking
//
//  Created by Reem Alammari on 11/05/1445 AH.
//

import SwiftUI

struct SelectionRow: View {
    typealias Action = (String) -> Void
    var action: Action?
    let title: String
    @Binding var selectedItem: String?
    @State var isSelect: Bool = false
    var body: some View {
        HStack {
         
                Text(title)
                .frame(maxWidth: .infinity , alignment: .leading)
            
                   if title == selectedItem{
                      
                       Image(systemName: "circle")
                           .font(.title3)
                           .overlay{
                               Image(systemName: "circle.fill")
                                   .font(.footnote)
                           }
                           .foregroundColor(.blue2.opacity(0.8))
                           
                      
                   }else{
                       Image(systemName: "circle")
                           .font(.title3)
                           .foregroundColor(.blue2)
                      
                   }
        }.onTapGesture {
            if title == selectedItem{
                selectedItem = nil
              
            }else{
                selectedItem = title
            }
        }

        }
    }
 

#Preview {
    SelectionRow(title: "NoneName", selectedItem: .constant("NoneName"))
}


//
//  SquareButton.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//

import SwiftUI

struct SquareButton: View {
    var body: some View {
        
        Button(action: {}
               , label: {
            RoundedRectangle(cornerRadius: 8.0)
                  .frame(width: 40 , height: 40)
                  .foregroundColor(.white)
                  .overlay{
                      Image(systemName: "slider.horizontal.3")
                          .foregroundColor(.blue2)
                          .font(.title)
                  }
        })
        
        
        
      
    }
}

#Preview {
    SquareButton()
}

//
//  ShwingSheetGuest.swift
//  HotelBooking
//
//  Created by Reem Alammari on 10/05/1445 AH.
//

import SwiftUI

struct ShwingSheetGuest: View {
    @Binding private var adultsNumber: Int
    @Binding private var childrenNumber: Int
    @Binding private var infantsNumber: Int
    var body: some View {
        VStack(alignment: .leading){
           
          Text(NSLocalizedString("Select Guest", comment:"Select Guest"))
                .font(.title3)
                .bold()
                .foregroundColor(.black2)
           
            HStack {
                VStack(alignment: .leading) {
                    Stepper(value: $adultsNumber) {
                        
                        Text(NSLocalizedString("Adults :" , comment:"Adults :") + "\(adultsNumber)")
                            .foregroundColor(.black2)
                    }
                   
                    Text( NSLocalizedString("Age 14 or above", comment:"Age 14 or above"))
                        .foregroundColor(.gray2)
                }
            }
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Stepper(value: $childrenNumber) {
                       
                        Text( NSLocalizedString("Children :", comment:"Children :") + " \(childrenNumber)")
                            .foregroundColor(.black2)
                    }
               
                    Text(NSLocalizedString("Ages 2-13", comment:"Ages 2-13"))
                        .foregroundColor(.gray2)
                }
            }
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Stepper(value: $infantsNumber) {
                      
                        Text(  NSLocalizedString("Infants :", comment:"Infants :") + " \(infantsNumber)")
                            .foregroundColor(.black2)
                           
                    }
                   
                    Text( NSLocalizedString("Under 2", comment:"Under 2"))
                        .foregroundColor(.gray2)
                }
            }
         Spacer()
                CustomButton()
              .padding(.leading, 140)
        }.padding()
    }
}


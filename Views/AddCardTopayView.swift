//
//  AddCardTopayView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 11/05/1445 AH.
//

import SwiftUI

struct AddCardTopayView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var carVM = CardViewModel()
    @State var cardNumber: String = ""
    @State var cardHolder: String = ""
    @State var expairDate: Date = Date()
    @State var cvvNumber: String = ""
    @State var cardNumberError: String = ""
    @State var cardHolderError: String = ""
    @State var cvvNumberError: String = ""
    var dateFormater : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 20.0){
            
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue2, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .overlay{
                        VStack(alignment: .leading){
                            Text("Card Number")
                                .foregroundColor(.blue2)
                            TextField("", text: $cardNumber)
                            
                            if (cardNumber.count != 16 ){
                               Text(cardNumberError)
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            }
                        }.padding(.horizontal)
                    }.onChange(of: cardNumber) { newValue  , newValue2 in
                        if newValue.count != 16 {
                            cardNumberError = "Enter valid card number"
                        }
                    }
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue2, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .overlay{
                    VStack(alignment: .leading){
                        Text("Card Holder Name")
                            .foregroundColor(.blue2)
                        TextField("", text: $cardHolder)
                        if (cardHolder.isEmpty ){
                           Text(cardHolderError)
                                .font(.footnote)
                                .foregroundColor(.red)
                        }
                        
                    }.padding(.horizontal)
                }.onChange(of: cardHolder) { newValue1 , newValue2 in
                    if newValue1.isEmpty {
                        cardHolderError = "Enter card holder name"
                    }
                }
            HStack(spacing: 20.0){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue2, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .overlay{
                        VStack(alignment: .leading) {
                            Text("Expiry Date")
                            .foregroundColor(.blue2)
                                                   
                            DatePicker("", selection: $expairDate, displayedComponents: .date)
                                .labelsHidden()
                            
                         }.padding(.horizontal)
                     }
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue2, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .overlay{
                        VStack(alignment: .leading){
                            Text("CVV")
                                .foregroundColor(.blue2)
                            
                            TextField("", text: $cvvNumber)
                            if cvvNumber.count != 3 {
                               Text(cardNumberError)
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            }
                        }.padding(.horizontal)
                    }.onChange(of: cvvNumber) { newValue , newValue2 in
                        if newValue.count != 3 {
                            cardNumberError = "Enter valid CVV"
                        }
                    }
            }
            Button {
                
//                let formatter = DateFormatter()
//                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Use the desired format
//                formatter.timeZone = TimeZone(identifier: "UTC") // Set the desired time zone
//                let dateString = formatter.string(from: expairDate)


                    carVM.addCard(cardNumber: cardNumber, cardHolder: cardHolder, expiryDate: expairDate, cvv: cvvNumber)

                  

                presentationMode.wrappedValue.dismiss()
            } label: {
                
                CustomButton(text: "Add Card")
                    .padding(.top)
            }

            
            
            
        }.padding(.horizontal)
        
            
    }
}

#Preview {
    AddCardTopayView()
}

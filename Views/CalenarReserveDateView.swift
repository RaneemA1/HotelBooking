//
//  CalenarReserveDateView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 10/05/1445 AH.
//

import SwiftUI

struct CalenarReserveDateView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.calendar) var calendar
    @State var dates: Set<DateComponents> = []
    @Binding var selectInterval: String 
  
    var dateRange: Range<Date>{
    let start = Calendar.current.date(from: DateComponents(timeZone: .current , year: 2023, month: 11, day: 24))!
    let end = Calendar.current.date(from: DateComponents(timeZone: .current , year: 2023, month: 12, day: 31))!
        return start..<end
    }

  func getDatesInterval(date: Set<DateComponents>)-> String {
     let datesArray: [Date] = Array(date).map{ d in
         Calendar.current.date(from: d)!
     }.sorted{ d1 , d2 in d1 < d2}
     if datesArray.count == 2 {
        
         return  NSLocalizedString("Start :", comment:"Start :") + " \(datesArray[0].formatted(date: .long, time: .omitted))\n " + NSLocalizedString("ِEnd :", comment:"End :") + " \(datesArray[1].formatted(date: .long, time: .omitted)) "
     }
     return "none"
  }

        var body: some View {
            VStack{
                
               
                MultiDatePicker(NSLocalizedString("Select Dates", comment:"Select Dates"), selection: $dates, in: dateRange)
                    .tint(.blue2)
                    Text(selectInterval)
                    .foregroundColor(.black2 .opacity(0.6))
                    .bold()
                    .background(
                      RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray2.opacity(0.5), lineWidth: 1)
                        .frame(width: 350, height: 60)
                    )
                    .padding(.bottom, 40)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                        CustomButton()
                }

            }
            .padding()
            .onChange(of: dates){ a , newValue in
                if newValue.capacity > 1{
                    selectInterval = getDatesInterval(date: newValue)
                }
                
            }
        }
  
    }
#Preview {
    CalenarReserveDateView(selectInterval: .constant(""))
}

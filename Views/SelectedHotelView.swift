//
//  SelectedHotelView.swift
//  HotelBooking
//
//  Created by Reem Alammari on 09/05/1445 AH.
//

import SwiftUI

//This page For Style page hotel

struct SelectedHotelView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.locale) var locale
    var hotelname: String = ""
    var hotelImage: URL?
    var hotelCity: String = ""
    var price: Float = 0.0
    @State var adult: Int = 0
    @State var children: Int = 0
    @State var infants: Int = 0
    @State var interval : String = ""
    var description: String = ""
    @State var isShwingSheetCalendar: Bool = false
    @State var isShwingSheetGuest: Bool = false
    @StateObject var vmBooking = BookingViewModel()
    @State var isConfirm: Bool = false
   
    var body: some View {
        
        NavigationStack {
            VStack{
                ScrollView(showsIndicators: false){
                    VStack {
                        HeaderView()
                            .padding(.bottom)
                        VStack(alignment: .leading, spacing: 20.0){
                            ZStack {
                                AsyncImage(url: hotelImage){image in
                                    image
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 8*29)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                }placeholder: {
                                    ProgressView()
                                }
                                .frame(maxWidth: .infinity)
                            .frame(height: 200)
                               // HeartToLike()
                                //    .offset(x: 140 , y: -80)
                            }
                            Text(hotelname)
                                .font(.title2)
                                .foregroundColor(.black2)
                                .bold()
                            HStack{
                                Image(systemName: "mappin.and.ellipse")
                                Text(hotelCity)
                                    .font(.footnote)
                                    .foregroundColor(.gray2)
                            }
                            Divider()
                            
                            VStack(alignment: .leading) {
                               
                                Text(NSLocalizedString("Overview", comment:"Overview"))
                                    .font(.title3)
                                    .foregroundColor(.black2)
                                    .bold()
                                Text(description)
                                    .font(.title3)
                                    .foregroundColor(.black2.opacity(0.6))
                            }
                    
                
                            Divider()
                            
                                HStack {
                                    
                                    Text( NSLocalizedString("Select Date :", comment:"Select Date :"))
                               
                                        .font(.title3)
                                        .foregroundColor(.black2)
                                        .bold()
                                    Spacer()
                                    Button {
                                        isShwingSheetCalendar.toggle()
                                    } label: {
                                       
                                        ButtonsForSelectedView(text:  NSLocalizedString("Choose", comment:""))
                                    }.padding(.trailing, 45)
                                }
                             
                            Divider()
                            HStack {
                               
                                Text(NSLocalizedString("Select Guest :", comment:"Select Guest :"))
                                    .font(.title3)
                                    .foregroundColor(.black2)
                                    .bold()
                                Spacer()
                                Button {
                                    isShwingSheetGuest.toggle()
                                } label: {
                                  
                                    ButtonsForSelectedView(text:   NSLocalizedString("Add", comment:"Add"))
                                }.padding(.trailing, 40)
                            } .sheet(isPresented: $isShwingSheetGuest, content: {
                                VStack(alignment: .leading){
                                  
                                    Text(NSLocalizedString("Select Guest", comment:"Select Guest"))
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.black2)
                                   
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Stepper(value: $adult) {
                                               
                                                Text( NSLocalizedString("Adults :", comment:"Adults :") + "\(adult)")
                                                    .foregroundColor(.black2)
                                            }
                                           
                                            Text( NSLocalizedString("Age 14 or above", comment:"Age 14 or above"))
                                                .foregroundColor(.gray2)
                                        }
                                    }
                                    Divider()
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Stepper(value: $children) {
                                                
                                                Text(NSLocalizedString("Children :", comment:"Children :") + " \(children)")
                                                    .foregroundColor(.black2)
                                            }
                                           
                                            Text( NSLocalizedString("Ages 2-13", comment:"Ages 2-13"))
                                                .foregroundColor(.gray2)
                                        }
                                    }
                                    Divider()
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Stepper(value: $infants) {
                                               
                                                
                                                Text(NSLocalizedString("Infants :", comment:"Infants :" + " \(infants)"))
                                                    .foregroundColor(.black2)
                                                   
                                            }
                                            
                                            Text(NSLocalizedString("Under 2", comment:"Under 2"))
                                                .foregroundColor(.gray2)
                                        }
                                    }
                                 Spacer()
                                    Button {
                                        vmBooking.addBooking(enHotelCity: hotelCity, arHotelCity: hotelCity, enHotelName: hotelname, arHotelName: hotelname, image: hotelImage, price: price, adult: adult, children: children, infant: infants, interval: interval)
                                       
                                    } label: {
                                        CustomButton()
                                      .padding(.leading, 140)
                                    }

                                       
                                }.padding()
                        })
                            Divider()
                            
                        }.padding(.horizontal)
                    }
                }
                //====================================
                    Spacer()
                    VStack{
                        
                        Rectangle()
                            .edgesIgnoringSafeArea(.bottom)
                            .shadow(radius: -4,y: -4)
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.gray2)
                            .opacity(0.3)
                          
                            .overlay{
                                HStack{
                                    
                                   
                                   Text( NSLocalizedString("Price :", comment:"") + "\(Int(price))")
                                        .foregroundColor(.black2)
                                        .font(.title)
                                        .bold()
                                    
                                    Spacer()
                                    
                                   
                                        NavigationLink {
                                            DetailsAndPayView(hotelName: hotelname,
                                                              hotelImage: hotelImage,
                                                              location: hotelCity,
                                                              adult: adult ,
                                                              children: children ,
                                                              intervalDate: interval    , price: price )
                                        } label: {
                                            Text(NSLocalizedString("Confirm", comment:" "))
                                                .foregroundColor(.white)
                                                .bold()
                                                .padding()
                                                .background(
                                                    RoundedRectangle(cornerRadius: 12.0)
                                                        .frame(width: 8*25 , height: 50)
                                                        .foregroundColor(.blue2)
                                                )
                                            
                                            
                                        }.padding(.trailing, 70)
                                            .statusBar(hidden: true)
                                   
                                }.padding(.horizontal)
                                
                                
                            }
                    }
                
                 
            }.sheet(isPresented: $isShwingSheetCalendar , content: {
                VStack(alignment: .leading) {
                   
                    CalenarReserveDateView( selectInterval: $interval)
                    
                }
            })

         
        }
    }
}

#Preview {
    SelectedHotelView()
}

/*
 
 import SwiftUI

 struct Names: Identifiable{
     var id = UUID()
     var names: String
 }

 var allNames: [Names] =
 [
 Names(names: NSLocalizedString("1", comment:"any 1")),
 Names(names: NSLocalizedString("2", comment:"any 2")),
 Names(names: NSLocalizedString("3", comment:"any 3")),
 Names(names: NSLocalizedString("4", comment:"any 3")),
 ]

 struct Gg: View {
     @Environment(\.locale) var locale
     var body: some View {
         VStack{
             ForEach(allNames){ i in
                 Text(locale.language.languageCode?.identifier == "en" ? i.names : i.names) // here in arabic
             }
         }
     }
 }

 #Preview {
     Gg()
 }
 
 */

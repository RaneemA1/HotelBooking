//
//  AddingCity.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//


import SwiftUI

struct AddingCity: View {
    @ObservedObject var data: FileBase
   // var city : AllCities
   // var hotel : HotelsDetails
    var body: some View {
       
             
        VStack {
           
            ScrollView(.horizontal ,showsIndicators: false){
                    HStack {
                        ForEach(data.allcities){ city in
                            
                    NavigationLink {
                        if city.cityName == "Riyadh" {
                            RiyadhView()
                            
                        }else if city.cityName == "Jeddah" {
                            JeddahHotelView()
                            
                        }else if city.cityName == "Makkah" {
                            MakkahView()
                        }
                    } label: {
                     
                            VStack{
                                AsyncImage(url: city.image ){image in
                                        image
                                            .resizable()

                                            .frame(width:8*15 , height: 8*15)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                    }placeholder: {
                                        ProgressView()
                                    }
                               
                               
                                    Text(city.cityName)
                                        .foregroundColor(.black2)
                                        .font(.title3)
                                         
                                    
                            }
                        
                                }.statusBar(hidden: true)
                                .navigationBarBackButtonHidden()
                            }
                }.padding(.horizontal)
            }
        }
            
        
    }
}

#Preview {
    AddingCity(data: FileBase())
}

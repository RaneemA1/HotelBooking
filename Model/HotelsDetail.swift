//
//  HotelsModel.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//

import SwiftUI

struct HotelsDetail:Identifiable{
    var id = UUID()
    var idCity: UUID = UUID()
    var hotelImage: URL?
    var hotelName: String = ""
    var hotelLocation: String = ""
    var price: Double = 0.0
    var descriptions: String = ""
    var fullRate: Bool = false
    
}


/*
 
 
 struct City: Identifiable {
     var id = UUID()
     var image: URL?
     var cityName: String = ""
     var hotel: [Hotel]
    
 }








 struct Hotel:Identifiable{
     var id = UUID()
     var hotelImage: URL?
     var hotelName: String = ""
     var hotelLocation: String = ""
     var descriptions: String = ""
     var rateNumber: Float = 0.5
     var starsNumber: Int = 0
 }

 */

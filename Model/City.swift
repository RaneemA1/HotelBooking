//
//  AllCities.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//

import SwiftUI

struct City: Identifiable {
    var id = UUID()
    var image: URL?
    var cityName: String = ""
    var hotelDetails1: HotelsDetail
    var hotelDetails2: HotelsDetail
}

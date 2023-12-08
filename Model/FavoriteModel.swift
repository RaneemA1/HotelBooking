//
//  FavoriteModel.swift
//  HotelBooking
//
//  Created by Reem Alammari on 24/05/1445 AH.
//

import Foundation

struct FavoriteHotel: Codable , Identifiable{
    let id: UUID?
    let en_city: String
    let ar_city: String
    let en_hotel_name: String
    let ar_hotel_name: String
    let hotel_image: URL?
    let en_address: String
    let ar_address: String
    let en_description: String
    let ar_description: String
    let rating: Int
    let en_price: Float

   
}

//
//  User.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 23/05/1445 AH.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    let name: String
    let uid: String
    let dob: Date
    let gender: String
    let email: String
    let mobile: String
    
    
    init(name: String, uid: String, dob: Date, gender: String, email: String, mobile: String) {
        self.id = 0
        self.uid = uid
        self.name = name
        self.dob = dob
        self.gender = gender
        self.email = email
        self.mobile = mobile
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.uid = try container.decode(String.self, forKey: .uid)
        
        let dateString = try container.decode(String.self, forKey: .dob)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .init(identifier: "sa")
        self.dob = dateFormatter.date(from: dateString)!
        
        self.gender = try container.decode(String.self, forKey: .gender)
        self.email = try container.decode(String.self, forKey: .email)
        self.mobile = try container.decode(String.self, forKey: .mobile)
    }
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case uid
        case dob
        case gender
        case email
        case mobile
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.uid, forKey: .uid)
        try container.encode(self.dob.ISO8601Format(), forKey: .dob)
        try container.encode(self.gender, forKey: .gender)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.mobile, forKey: .mobile)
        
    }
}

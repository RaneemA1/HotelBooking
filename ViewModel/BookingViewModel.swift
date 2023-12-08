//
//  BookingViewModel.swift
//  HotelBooking
//
//  Created by Reem Alammari on 24/05/1445 AH.
//

import SwiftUI
import Foundation


struct BookInfo: Identifiable, Codable {
    var id: UUID?
    let en_city: String
    let ar_city: String
    let en_hotel_name: String
    let ar_hotel_name: String
    let hotel_image: URL?
    let en_price: Float
    let interval_date : String
    let adult: Int
    let children: Int
    let infant: Int
}

class BookingViewModel: ObservableObject {
    @Published var booked : [BookInfo] = []

    func fetchBooking() {
        let url = URL(string:"https://odqczqchacloconwfpcb.supabase.co/rest/v1/Booking?select=*")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // Set your headers here
        request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kcWN6cWNoYWNsb2NvbndmcGNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE3NjgxNTksImV4cCI6MjAxNzM0NDE1OX0.llGm4vNqkFc047DnXxFdnqYu3UbxGypIIMaE6jUfrQ4", forHTTPHeaderField: "apikey")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kcWN6cWNoYWNsb2NvbndmcGNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE3NjgxNTksImV4cCI6MjAxNzM0NDE1OX0.llGm4vNqkFc047DnXxFdnqYu3UbxGypIIMaE6jUfrQ4", forHTTPHeaderField: "Authorization")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error with fetching data: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let booked = try decoder.decode([BookInfo].self, from: data)

                    // Update your view model with the fetched data
                    DispatchQueue.main.async {
                        self.booked = booked
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }

        task.resume()
    }

    func addBooking(enHotelCity: String ,arHotelCity: String , enHotelName: String , arHotelName: String, image: URL? ,price: Float , adult: Int , children: Int , infant: Int , interval: String ) {
        let tempRaw = BookInfo(en_city: enHotelCity, ar_city: arHotelCity, en_hotel_name: enHotelName, ar_hotel_name: arHotelName, hotel_image:  image , en_price: price , interval_date: interval , adult: adult , children: children , infant: infant)
        
        DispatchQueue.main.async {
            self.booked.append(tempRaw)
        }

        let url = URL(string: "https://odqczqchacloconwfpcb.supabase.co/rest/v1/Booking")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Set your headers here
        request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kcWN6cWNoYWNsb2NvbndmcGNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE3NjgxNTksImV4cCI6MjAxNzM0NDE1OX0.llGm4vNqkFc047DnXxFdnqYu3UbxGypIIMaE6jUfrQ4", forHTTPHeaderField: "apikey")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kcWN6cWNoYWNsb2NvbndmcGNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE3NjgxNTksImV4cCI6MjAxNzM0NDE1OX0.llGm4vNqkFc047DnXxFdnqYu3UbxGypIIMaE6jUfrQ4", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601 // Use ISO 8601 date format
            let jsonData = try encoder.encode(tempRaw)
            request.httpBody = jsonData
        } catch {
            print("Error encoding card data: \(error)")
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error with fetching data: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Did not receive a valid HTTP response")
                return
            }

            if (200...299).contains(httpResponse.statusCode) {
                print("New row added successfully with status code: \(httpResponse.statusCode)")
            } else {
                print("Failed to add new row with status code: \(httpResponse.statusCode)")

                if let data = data {
                    let responseString = String(data: data, encoding: .utf8)
                    print("Response data: \(responseString ?? "")")
                }
            }
        }

        task.resume()
    }
}


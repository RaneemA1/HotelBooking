//
//  JeddahHotelViewModel.swift
//  HotelBooking
//
//  Created by Reem Alammari on 23/05/1445 AH.
//

import Foundation


struct JeddahHotel: Codable , Identifiable{
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

class JeddahViewModel:  ObservableObject {
    @Published var jeddahHotels: [JeddahHotel] = []
    
    init(){
        fetchHotel()
    }
    
    func fetchHotel() {
       
        let url = URL(string: "https://odqczqchacloconwfpcb.supabase.co/rest/v1/Jeddah?select=*")!
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
                    let jeddahHotels = try decoder.decode([JeddahHotel].self, from: data)
                      
                 
                    DispatchQueue.main.async {
                        self.jeddahHotels = jeddahHotels
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }

        task.resume()
      
    }

    
}

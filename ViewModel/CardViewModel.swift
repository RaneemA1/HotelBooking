//
//  CardViewModel.swift
//  HotelBooking
//
//  Created by Reem Alammari on 22/05/1445 AH.
//

import Foundation

/*struct CardInfo: Identifiable , Codable{
    var id: UUID?
    var card_number: String
    var card_holder: String
    var expiry_date: Date?
    var cvv: String
    
}

class CardViewModel: ObservableObject{
    @Published var card: Array<CardInfo> = []
    
    
    func fitchCard(){
        let url = URL(string: "https://odqczqchacloconwfpcb.supabase.co/rest/v1/Card?select=*")!
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
                           let card = try decoder.decode([CardInfo].self, from: data)

                           // Update your view model with the fetched data
                           DispatchQueue.main.async {
                               self.card = card
                           }
                       } catch {
                           print("Error decoding JSON: \(error)")
                       }
                   }
        }

        task.resume()

    }
    func addCard(cardNumber: String, cardHolder: String, expiryDate: Date, cvv: String) {
       
        let tempRaw = CardInfo(card_number: cardNumber, card_holder: cardHolder, expiry_date: expiryDate , cvv: cvv)
          
          // Append the new card locally
          DispatchQueue.main.async {
              self.card.append(tempRaw)
          }
        
        let url = URL(string: "https://odqczqchacloconwfpcb.supabase.co/rest/v1/Card")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Set your headers here
        request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kcWN6cWNoYWNsb2NvbndmcGNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE3NjgxNTksImV4cCI6MjAxNzM0NDE1OX0.llGm4vNqkFc047DnXxFdnqYu3UbxGypIIMaE6jUfrQ4", forHTTPHeaderField: "apikey")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kcWN6cWNoYWNsb2NvbndmcGNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE3NjgxNTksImV4cCI6MjAxNzM0NDE1OX0.llGm4vNqkFc047DnXxFdnqYu3UbxGypIIMaE6jUfrQ4", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
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
*/
struct CardInfo: Identifiable, Codable {
    var id: UUID?
    var card_number: String
    var card_holder: String
    var expiry_date: Date?
    var cvv: String
}

class CardViewModel: ObservableObject {
    @Published var card: [CardInfo] = []

    func fetchCard() {
        let url = URL(string: "https://odqczqchacloconwfpcb.supabase.co/rest/v1/Card?select=*")!
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
                    let card = try decoder.decode([CardInfo].self, from: data)

                    // Update your view model with the fetched data
                    DispatchQueue.main.async {
                        self.card = card
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }

        task.resume()
    }

    func addCard(cardNumber: String, cardHolder: String, expiryDate: Date, cvv: String) {
        let tempRaw = CardInfo(card_number: cardNumber, card_holder: cardHolder, expiry_date: expiryDate, cvv: cvv)

        // Append the new card locally
        DispatchQueue.main.async {
            self.card.append(tempRaw)
        }

        let url = URL(string: "https://odqczqchacloconwfpcb.supabase.co/rest/v1/Card")!
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


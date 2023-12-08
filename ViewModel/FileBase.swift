//
//  FileBase.swift
//  HotelBooking
//
//  Created by Reem Alammari on 06/05/1445 AH.
//

import SwiftUI
import Combine

class FileBase: ObservableObject {
    @Published var searchForHotel: String = ""
    @Published var allcities: Array<City> = []
    @Published var fullRateHotel: Array<City> = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
            fetch()

        
        searchAll()
        }
    
    func searchAll(){// Combine the latest values from searchForHotel and allcities
        Publishers.CombineLatest($searchForHotel, $allcities)
            .sink { [weak self] searchTerm, allCities in
                // Filter the hotels based on the search term
                let filteredHotels = allCities
                    .compactMap { city -> City? in
                        if city.hotelDetails1.fullRate || city.hotelDetails1.hotelName.localizedCaseInsensitiveContains(searchTerm) {
                            return City(image: city.image, cityName: city.cityName, hotelDetails1: city.hotelDetails1, hotelDetails2: city.hotelDetails2)
                        }
                        if city.hotelDetails2.fullRate || city.hotelDetails2.hotelName.localizedCaseInsensitiveContains(searchTerm) {
                            return City(image: city.image, cityName: city.cityName, hotelDetails1: city.hotelDetails1, hotelDetails2: city.hotelDetails2)
                        }
                        return nil
                    }

                // Update the fullRateHotel array
                self?.fullRateHotel = filteredHotels
            }
            .store(in: &cancellables)
    }
    
    func fetch(){
  
        let city1: City = City(image:URL(string:"https://gumlet.assettype.com/ajel%2F2023-06%2F3c4f31c4-d60b-4137-a13b-b87b7935c37a%2Frfhy.jpg?auto=format%2Ccompress&fit=max&format=webp&w=600&dpr=2.0")!, cityName: "Riyadh" ,
            hotelDetails1: HotelsDetail(
                hotelImage: URL(string:"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/86/44/28/movenpick-hotel-and-residences.jpg?w=1400&h=-1&s=1")! ,
                hotelName:"Movenpick Hotel And Residences Riyadh" ,
                hotelLocation: "Riyadh-Exit4-Al Gadeer District",
                price: 1800 ,
                descriptions:"#1 of 524 hotels in Riyadh",
                fullRate: true ),
                                         
            hotelDetails2: HotelsDetail(
                hotelImage: URL(string: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/5e/fc/9c/mansard-riyadh-a-radisson.jpg?w=1400&h=-1&s=1")! ,
                hotelName:"Mansard Riyadh, A Radisson Collection Hotel" ,
                hotelLocation: "Riyadh Prince Mohammed Ibn Salman Ibn Abdeulaziz Street",
                price: 2188 ,
                descriptions:"Enjoy access to 24-hour room service and spa, and proficient housekeeping twice daily. Our hotel is located in the new heart of the city along the new metro line with easy access to the famous King Khalid International and King Abdullah Financial Airport.",
                fullRate: true))
         
        let city2: City = City(image:URL(string: "https://www.ahstatic.com/photos/a5f2_ho_00_p_2048x1536.jpg")!, cityName: "Makkah" ,
            hotelDetails1: HotelsDetail(
                hotelImage:URL(string: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/dd/44/ef/address-jabal-omar-makkah.jpg?w=1100&h=-1&s=1")! ,
                hotelName:"Address Jabal Omar Makkah" , 
                hotelLocation: "Makkah, Prince Mohammed Bin Salman Road" ,
                price: 775,
                descriptions:"#2 of 342 hotels in Mecca" ,
                fullRate: true),
            hotelDetails2: HotelsDetail(
                hotelImage:URL(string: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/dd/44/ef/address-jabal-omar-makkah.jpg?w=1100&h=-1&s=1")! ,
                hotelName:"Elaf Kinda Hotel" ,
                hotelLocation: "Makkah, Ibrahim Khalil Street" ,
                price: 766,
                descriptions:"Rooms at Elaf Kindah Makkah feature a flat-screen TV, air conditioning, and a refrigerator, and guests can stay connected with free wifi."))
        
        let city3: City = City(image:URL(string: "https://gawlah.com/wp-content/uploads/2021/06/jeddah.jpg")!, cityName: "Jeddah"
           ,hotelDetails1: HotelsDetail(
                hotelImage: URL(string: "") ,
                hotelName:"Swissotel Living Jeddah",
                hotelLocation: "Jeddah, Prince Saud Alfaisal Street" ,
                price: 828,
                descriptions:"The luxurious 5-star Swissotel Living Jeddah Hotel and Apartments is located in one of the well-known commercial districts in the city of Jeddah, which is considered the heart of Jeddah.",
                fullRate: true),
            hotelDetails2: HotelsDetail())
      
        
        let city4: City = City(image:URL(string: "https://www.spa.gov.sa/_next/image?url=https%3A%2F%2Fportalcdn.spa.gov.sa%2Fbackend%2Foriginal%2F201906%2F9d13d3533d89e8d20cbdcc235cbd808c.jpeg&w=3840&q=75")!, cityName: "Taief" ,
            hotelDetails1: HotelsDetail(
                hotelImage: URL(string: "") ,
                hotelName:"Helton",
                hotelLocation: "Taief" ,
                price: 800 ,
                descriptions:"This hotel ...description"),
            hotelDetails2: HotelsDetail())
        
        let city5: City = City(image: URL(string: "https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1300,c_scale,q_auto/cnnarabic/2020/05/09/images/154294.avif")!, cityName: "Abha" ,
          hotelDetails1: HotelsDetail(
               hotelImage: URL(string: "") ,
               hotelName:"Helton",
               hotelLocation: "Abha" ,
               price: 800,
               descriptions:"This hotel ...description"),
          hotelDetails2: HotelsDetail())
        
        allcities = [city1 , city2 , city3 , city4 , city5]
        
        fullRateHotel = allcities.filter({$0.hotelDetails1.fullRate == true}) +
                        allcities.filter({$0.hotelDetails2.fullRate == true})
     
        
    }
    
}


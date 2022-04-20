//
//  NetworkService.swift
//  Facebook Integration
//
//  Created by Lakith Jayalath on 2022-04-21.
//

import Foundation
import Alamofire

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    private var hotelData: [HotelData] = []
    
    // get the response from the API
    func fetchHotels() {
        
        AF.request("https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json")
          .validate()
          .responseDecodable(of: Hotel.self) { (response) in
            guard let hotel = response.value else { return }
              self.hotelData = hotel.data
              print("HOTEL ", hotel.data)
          }
        
      }
    
    func getHotelData() -> [HotelData] {
        return hotelData
    }
    
    
}

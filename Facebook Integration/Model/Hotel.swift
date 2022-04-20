//
//  Hotel.swift
//  Facebook Integration
//
//  Created by Lakith Jayalath on 2022-04-20.
//

import Foundation

struct Hotel: Codable {
    let status: Int
    let data: [HotelData]
}

// MARK: - Hotel Data
struct HotelData: Codable {
    let id: Int
    let title, description, address, postcode: String
    let phoneNumber, latitude, longitude: String
    let image: Image

    enum CodingKeys: String, CodingKey {
        case id, title
        case description
        case address, postcode, phoneNumber, latitude, longitude, image
    }
}

// MARK: - Image
struct Image: Codable {
    let small, medium, large: String
}

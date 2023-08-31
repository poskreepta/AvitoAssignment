//
//  AdvertisementDetail.swift
//  AvitoAssignment
//
//  Created by poskreepta on 29.08.23.
//

import Foundation

class AdvertisementDetail: Codable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
    let description: String
    let email: String
    let phoneNumber: String
    let address: String
    var imageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, location, description, email, address
        case imageUrl = "image_url"
        case createdDate = "created_date"
        case phoneNumber = "phone_number"
    }
}

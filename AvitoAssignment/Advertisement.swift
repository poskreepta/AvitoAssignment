//
//  Advertisements.swift
//  AvitoAssignment
//
//  Created by poskreepta on 29.08.23.
//

import Foundation

class Advertisement: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    var imageData: Data?
    let createdDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, location, imageUrl = "image_url", createdDate = "created_date"
    }
}

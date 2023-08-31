//
//  Endpoints.swift
//  AvitoAssignment
//
//  Created by poskreepta on 29.08.23.
//

import Foundation

enum Endpoints {
    case advertisementList
    case advertisementDetail(itemId: String)
    
    var url: URL? {
        switch self {
        case .advertisementList:
            return URL(string: "https://www.avito.st/s/interns-ios/main-page.json")
        case .advertisementDetail(let itemId):
            return URL(string: "https://www.avito.st/s/interns-ios/details/\(itemId).json")
        }
    }
    
    var request: URLRequest? {
        if let url = url {
            return URLRequest(url: url)
        }
        return nil
    }
}

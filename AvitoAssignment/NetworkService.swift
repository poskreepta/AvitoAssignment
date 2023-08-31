//
//  NetworkService.swift
//  AvitoAssignment
//
//  Created by poskreepta on 29.08.23.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getAdvertisementList(completion: @escaping(AdvertisementList?, NetworkErrors?) -> ())
    func getAdvertisementDetail(itemId: String, completion: @escaping(AdvertisementDetail?, NetworkErrors?) -> ())
    func getImageFor(urlString: String, completion: @escaping(Data?, NetworkErrors?) -> ())
    func getImageFor(urlString: [String], completion: @escaping ([Data?]?, NetworkErrors?) -> ())
}

enum NetworkErrors: Error {
    case noResponseFromServer
    case nilData
    case dataParsingError(error: Error)
    case connectingError(error: Error)
    case urlPharseFail
}

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    
    let path = "https://www.avito.st/s/interns-ios/main-page.json"
    var url: URL? {
        return URL(string: path)
    }
    
    private init() {}
    
    private func connectionHandle(response: URLResponse?, error: Error?) -> NetworkErrors? {
        if response == nil {
            return NetworkErrors.noResponseFromServer
        }
        if let error = error {
            return NetworkErrors.connectingError(error: error) 
        }
        return nil
    }
    
    // MARK: - Private funcs

    private func dataPharseTaskWith<T: Decodable>(url: URL?, completion: @escaping(T? , NetworkErrors?) -> ()) {
        guard let url = url else { completion(nil, .urlPharseFail); return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            var result: T?
            var errors = self.connectionHandle(response: response, error: error)
            do {
                guard let data = data else { throw NetworkErrors.nilData }
                result = try JSONDecoder().decode(T.self, from: data)
            } catch {
                errors = .dataParsingError(error: error)
            }
            DispatchQueue.main.async {
                completion(result, errors)
            }
        }.resume()
    }
    
    // MARK: - Public funcs

    func getAdvertisementList(completion: @escaping(AdvertisementList?, NetworkErrors?) -> ()) {
        dataPharseTaskWith(url: Endpoints.advertisementList.url, completion: completion)
    }
    
    func getAdvertisementDetail(itemId: String, completion: @escaping (AdvertisementDetail?, NetworkErrors?) -> ()) {
        dataPharseTaskWith(url: Endpoints.advertisementDetail(itemId: itemId).url, completion: completion)
    }
    
    func getImageFor(urlString: String, completion: @escaping (Data?, NetworkErrors?) -> ()) {
        guard let url = URL(string: urlString) else { completion(nil, .urlPharseFail); return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let errors = self.connectionHandle(response: response, error: error)
            DispatchQueue.main.async {
                completion(data, errors)
            }
        }.resume()
    }
    
    func getImageFor(urlString: [String], completion: @escaping ([Data?]?, NetworkErrors?) -> ()) {
        let loadingGroup = DispatchGroup()
        var images: [Data?]? = []
        var errorr: NetworkErrors?
        for urlPath in urlString {
            guard let url = URL(string: urlPath) else { images?.append(nil); break }
            loadingGroup.enter()
            URLSession.shared.dataTask(with: url) { data, response, error in
                errorr = self.connectionHandle(response: response, error: error)
                images?.append(data)
                loadingGroup.leave()
            }.resume()
        }
        loadingGroup.notify(queue: .main) {
            completion(images, errorr)
        }
    }
}

//
//  CartDetailViewModel.swift
//  AvitoAssignment
//
//  Created by poskreepta on 30.08.23.
//

import Foundation

protocol CartDetailViewModelType {
    var updateData: (() -> ())? { get set }
    var advertisementDetail: AdvertisementDetail? { get set }
    var showLoadingIndicator: ((Bool) -> ())? { get set }
    var isLoading: Bool { get set }
    func backPressed()
}

final class CartDetailViewModel: CartDetailViewModelType {
    
    var updateData: (() -> ())?
    var coordinator = MainCordinator(navigationController: BaseNavigationController())
    var networkService: NetworkServiceProtocol
    var advertisementDetail: AdvertisementDetail?
    var showLoadingIndicator: ((Bool) -> ())?
    var isLoading: Bool = false {
        didSet {
            showLoadingIndicator?(isLoading)
        }
    }
    
    init(coordinator: MainCordinator = MainCordinator(navigationController: BaseNavigationController()), networkService: NetworkServiceProtocol, productID: String) {
        self.coordinator = coordinator
        self.networkService = networkService
        loadAdvertisementDetailWith(productID)
    }
    
    private func loadAdvertisementDetailWith(_ id: String) {
        isLoading = true
        networkService.getAdvertisementDetail(itemId: id) { advertisementDetail, error in
            if let error = error {
                switch error {
                case .noResponseFromServer:
                    break
                case .nilData:
                    break
                case .dataParsingError(let error):
                    print("Data parsing error: \(error)")
                    break
                case .connectingError(let error):
                    print("Connection error: \(error)")
                    break
                case .urlPharseFail:
                    break
                }
            }
            self.advertisementDetail = advertisementDetail
            self.loadAdvertisementImage()
            self.isLoading = false
        }
    }
    
    private func loadAdvertisementImage() {
        guard let advertisementDetail = advertisementDetail else { return }
        networkService.getImageFor(urlString: advertisementDetail.imageUrl) { data, error in
            self.advertisementDetail?.imageData = data
            self.updateData?()
            self.showLoadingIndicator?(false)
        }
    }
    
    func backPressed() {
        coordinator.popViewController(animated: true)
    }
}

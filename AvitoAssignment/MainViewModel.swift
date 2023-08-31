//
//  MainViewModel.swift
//  AvitoAssignment
//
//  Created by poskreepta on 25.08.23.
//

import Foundation

protocol MainViewModelType {
    var advertisementList: AdvertisementList? { get set }
    var updateAdvertisementForIndex: ((Int) -> ())? { get set }
    var updateData: (() -> ())? { get set }
    var isLoading: Bool { get set }
    var showLoadingIndicator: ((Bool) -> ())? { get set }
    func viewLoaded()
    func selectAdvertisementWith(_ advertisementIndex: Int)
    var showErrorMessageClosure: ((Error) -> Void)? { get set }
}

class MainViewModel: MainViewModelType {
    var coordinator = MainCordinator(navigationController: BaseNavigationController())
    var updateData: (() -> ())?
    var updateAdvertisementForIndex: ((Int) -> ())?
    var showLoadingIndicator: ((Bool) -> ())?
    var showErrorMessageClosure: ((Error) -> Void)?
    var advertisementList: AdvertisementList? {
        didSet {
            updateData?()
        }
    }
    var isLoading: Bool = false {
         didSet {
             showLoadingIndicator?(isLoading)
         }
     }
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    //  MARK: - Private funcs
    private func loadAdvertisements() {
        isLoading = true
        networkService.getAdvertisementList { advertisementList, error in
            if let error = error {
                switch error {
                case .noResponseFromServer:
                    break
                case .nilData:
                    break
                case .dataParsingError(let error):
                    self.showErrorMessage(error)
                    print("Data parsing error: \(error)")
                    break
                case .connectingError(let error):
                    self.showErrorMessage(error)
                    print("Connection error: \(error)")
                    break
                case .urlPharseFail:
                    break
                }
            }
            self.advertisementList = advertisementList
            self.loadImagesForAdvertisement()
            self.isLoading = false
        }
    }
    
    private func loadImagesForAdvertisement() {
        guard let advertisements = advertisementList?.advertisements else { return }
        for (index, advertisement) in advertisements.enumerated() {
            networkService.getImageFor(urlString: advertisement.imageUrl) { imageData, errors in
                advertisement.imageData = imageData
                self.updateAdvertisementForIndex?(index)
            }
        }
    }
    
    //  MARK: - Public funcs
    func viewLoaded() {
        loadAdvertisements()
    }
    
    func selectAdvertisementWith(_ advertisementIndex: Int) {
        guard let advertisementID = advertisementList?.advertisements[advertisementIndex].id else { return }
        coordinator.pushToDetail(with: advertisementID)
    }
    
    func showErrorMessage(_ message: Error) {
        showErrorMessageClosure?(message)
    }
}

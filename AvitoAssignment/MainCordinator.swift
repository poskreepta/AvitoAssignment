//
//  MainCordinator.swift
//  AvitoAssignment
//
//  Created by poskreepta on 25.08.23.
//

import Foundation

class MainCordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: BaseNavigationController
    let networkService = NetworkService.shared

    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = MainViewModel(networkService: networkService)
        viewModel.coordinator = self
        let vc = MainCollectionViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushToDetail(with productID: String) {
        let viewModel = CartDetailViewModel(networkService: networkService, productID: productID)
        viewModel.coordinator = self
        let vc = CartDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}

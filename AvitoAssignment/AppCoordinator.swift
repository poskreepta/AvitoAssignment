//
//  AppCoordinator.swift
//  AvitoAssignment
//
//  Created by poskreepta on 26.08.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: BaseNavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    private func addCoordinator(_ coordinator: Coordinator) {
        coordinator.start()
        navigationController.addChild(coordinator.navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
    }
    
    func start() {
        let mainCoordinator = MainCordinator(navigationController: navigationController)
        mainCoordinator.start()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
    
    //    func showMainFlow() {
    //        addCoordinator(MainFlowCoordinator(tabBarController: tabBarController))
    //    }
    //
    //    func showCartFlow() {
    //        addCoordinator(CartFlowCoordinator(tabBarController: tabBarController))
    //    }
    //
    //    func showFavorietsFlow() {
    //        addCoordinator(FavorietsFlowCoorditanor(tabBarController: tabBarController))
    //    }
    //
    //    func showProfileFlow() {
    //        addCoordinator(ProfileFlowCoordinator(tabBarController: tabBarController))
    //    }
}

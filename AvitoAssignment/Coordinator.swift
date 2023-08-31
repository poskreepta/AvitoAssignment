//
//  CoordinatorProtocol.swift
//  AvitoAssignment
//
//  Created by poskreepta on 26.08.23.

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: BaseNavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
    
}

extension Coordinator {
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController.dismiss(animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> ())?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func addChild(_ coordinator: Coordinator) {
        guard childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator}) {
            childCoordinators.remove(at: index)
        }
    }
}

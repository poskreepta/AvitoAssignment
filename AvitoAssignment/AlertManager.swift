//
//  AlertManager.swift
//  AvitoAssignment
//
//  Created by poskreepta on 26.08.23.
//

import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}

// MARK: - Show Error Alerts
extension AlertManager {
    public static func showErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Ошибка", message: "\(error.localizedDescription)")
    }
    
}

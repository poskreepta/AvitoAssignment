//
//  UILabel + Extensions.swift
//  WeatherApp
//
//  Created by poskreepta on 23.06.23.
//

import UIKit

extension UILabel {
    
    func configureTitle() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: Fonts.montserratBold, size: 14)
        label.textAlignment = .left
        return label
    }
}

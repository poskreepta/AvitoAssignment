//
//  UICollectioViewCell+Identefier.swift
//  AvitoAssignment
//
//  Created by poskreepta on 25.08.23.
//

import UIKit

extension UICollectionViewCell {
    static var identefier: String {
        get {
            return String.init(describing: self)
        }
    }
}

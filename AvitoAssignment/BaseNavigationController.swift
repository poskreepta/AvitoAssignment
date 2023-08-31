//
//  BaseNavigationController.swift
//  MarketPlaceApp
//
//  Created by poskreepta on 22.06.23.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.clear 
        appearance.configureWithTransparentBackground()
//        appearance.backButtonAppearance.normal.backgroundImage = AppAsset.back.image
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        
    }
}

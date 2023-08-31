//
//  MainCompositionalLayout.swift
//  AvitoAssignment
//
//  Created by poskreepta on 30.08.23.
//

import UIKit

class MainCompositionalLayout: UICollectionViewCompositionalLayout {

    init() {
         super.init { (sectionIndex, environment) -> NSCollectionLayoutSection? in
             return MainCompositionalLayout.setupCells()
         }
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Section setup
    static private func setupCells() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(170), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(280))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.contentInsets = .init(top: 0, leading: 18, bottom: 18, trailing: 18)
            group.interItemSpacing = .fixed(18)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}

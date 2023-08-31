//
//  MainCollectionViewCell.swift
//  AvitoAssignment
//
//  Created by poskreepta on 25.08.23.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
        
    private var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()

    private var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratMedium, size: 14)
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        return label
    }()
    
    private var price: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratBold, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private var location: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: Fonts.montserratRegular, size: 11)
        label.textAlignment = .left
        return label
    }()
    
    private var date: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: Fonts.montserratRegular, size: 11)
        label.textAlignment = .left
        return label
    }()
    
    private var productID: String = "0"
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setupConstraints()
        setNeedsUpdateConstraints()
    }
   
    private func setupViews() {
        addSubview(image, title, price, location, date)
    }
    
    private func setupConstraints() {
        image.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(170)
        }

        title.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(vAdapted(to: 8))
            make.leading.trailing.equalTo(image)
        }
        
        price.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(vAdapted(to: 4))
            make.leading.trailing.equalTo(image)
        }
        
        location.snp.makeConstraints { make in
            make.top.equalTo(price.snp.bottom).offset(vAdapted(to: 4))
            make.leading.trailing.equalTo(image)
        }
        
        date.snp.makeConstraints { make in
            make.top.equalTo(location.snp.bottom)
            make.leading.trailing.equalTo(image)
        }
    }
       func configure(with product: Advertisement) {
           productID = product.id
           guard let imageData = product.imageData else { return }
           image.image = UIImage(data: imageData)
           title.text = product.title
           price.text = product.price
           location.text = product.location
           date.text = product.createdDate
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

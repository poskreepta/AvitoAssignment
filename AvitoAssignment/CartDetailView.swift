//
//  CartDetailView.swift
//  AvitoAssignment
//
//  Created by poskreepta on 30.08.23.
//

import UIKit
import SnapKit

protocol CartDetailViewDelegate: AnyObject {
    func didTapBackButton()
}

class CartDetailView: UIView {
    
    // MARK: Private properties
    private var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var price: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratBold, size: 30)
        label.textAlignment = .left
        return label
    }()
    
    private var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratBold, size: 18)
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        return label
    }()
    
    private var locationAdress: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratRegular, size: 13)
        label.textAlignment = .left
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Описание"
        label.font = UIFont(name: Fonts.montserratMedium, size: 20)
        label.textAlignment = .left
        return label
    }()
    
    private var descriptionAd: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratRegular, size: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Дата публикации"
        label.font = UIFont(name: Fonts.montserratMedium, size: 20)
        label.textAlignment = .left
        return label
    }()
    
    private var date: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratRegular, size: 15)
        label.textAlignment = .left
        return label
    }()
    
    private var contactLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Контакты для связи"
        label.font = UIFont(name: Fonts.montserratMedium, size: 20)
        label.textAlignment = .left
        return label
    }()
    
    private var email: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratRegular, size: 15)
        label.textAlignment = .left
        return label
    }()
    
    private var phoneNumber: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.montserratRegular, size: 15)
        label.textAlignment = .left
        return label
    }()
    
    private var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        return button
    }()
    
    // MARK: - Public properies
    
    weak var viewDelegate: CartDetailViewDelegate?
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(image, price, title, locationAdress, descriptionLabel, descriptionAd, dateLabel, date, contactLabel, email, phoneNumber, backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        descriptionLabel.isHidden = true
        dateLabel.isHidden = true
        contactLabel.isHidden = true
    }
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 50))
            make.leading.equalToSuperview().offset(hAdapted(to: 10))
            make.size.equalTo(resized(width: 30, height: 30))
        }
        image.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(vAdapted(to: 10))
            make.size.equalTo(resized(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
            make.centerX.equalToSuperview()
        }
        price.snp.makeConstraints { make in
            make.leading.trailing.equalTo(image).offset(hAdapted(to: 10))
            make.top.equalTo(image.snp.bottom).offset(vAdapted(to: 5))
        }
        title.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(price.snp.bottom).offset(vAdapted(to: 5))
        }
        locationAdress.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(title.snp.bottom).offset(vAdapted(to: 5))
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(locationAdress.snp.bottom).offset(vAdapted(to: 15))
        }
        descriptionAd.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(vAdapted(to: 5))
        }
        dateLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(descriptionAd.snp.bottom).offset(vAdapted(to: 10))
        }
        date.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(dateLabel.snp.bottom).offset(vAdapted(to: 5))
        }
        
        contactLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(date.snp.bottom).offset(vAdapted(to: 10))
        }
        
        email.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(contactLabel.snp.bottom).offset(vAdapted(to: 5))
        }
        phoneNumber.snp.makeConstraints { make in
            make.leading.trailing.equalTo(price)
            make.top.equalTo(email.snp.bottom).offset(vAdapted(to: 10))
        }
    }
    
    // MARK: - Public funcs
    
    func fill(product: AdvertisementDetail?) {
        guard let product = product else { return }
        guard let imageData = product.imageData else { return }
        image.image = UIImage(data: imageData)
        price.text = product.price
        title.text = product.title
        locationAdress.text = ("\(product.location), \(product.address)")
        descriptionAd.text = product.description
        date.text = product.createdDate
        email.text = product.email
        phoneNumber.text = product.phoneNumber
        descriptionLabel.isHidden = false
        dateLabel.isHidden = false
        contactLabel.isHidden = false
    }
    
    // MARK: - Actions
    
    @objc private func backButtonTapped() {
        viewDelegate?.didTapBackButton()
    }
}

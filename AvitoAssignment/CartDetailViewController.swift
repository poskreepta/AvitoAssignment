//
//  CartDetailViewController.swift
//  AvitoAssignment
//
//  Created by poskreepta on 30.08.23.
//

import UIKit

class CartDetailViewController: UIViewController {
    
    // MARK: Private properties
    
    private var viewModel: CartDetailViewModelType
    private var cartDetailView = CartDetailView()
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        return activityIndicator
    }()
    
    // MARK: - Init
    
    init(viewModel: CartDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        cartDetailView.viewDelegate = self
        view = cartDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeForViewModelUpdating()
        activityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupActivityIndicator()
    }
    // MARK: - Private funcs
    
    private func subscribeForViewModelUpdating() {
        viewModel.updateData = { [unowned self] in
            cartDetailView.fill(product: viewModel.advertisementDetail)
        }
        
        viewModel.showLoadingIndicator = { [weak self] isLoading in
            if isLoading {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
}

extension CartDetailViewController: CartDetailViewDelegate {
    func didTapBackButton() {
        viewModel.backPressed()
    }
}

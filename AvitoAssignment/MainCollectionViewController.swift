//
//  MainViewController.swift
//  AvitoAssignment
//
//  Created by poskreepta on 25.08.23.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    // MARK: Private properties
    private var viewModel: MainViewModelType
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        return activityIndicator
    }()
    
    // MARK: - Init
    init(viewModel: MainViewModelType) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: MainCompositionalLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        viewModel.viewLoaded()
        subscribeForViewModelUpdating()
        activityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupActivityIndicator()
    }
    
    // MARK: - Private funcs
    private func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(MainCollectionViewCell.self)
    }
    
    private func setupActivityIndicator() {
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    private func subscribeForViewModelUpdating() {
        viewModel.updateData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.showErrorMessageClosure = { [weak self] message in
            if let self = self {
                AlertManager.showErrorAlert(on: self, with: message)
            }
        }
        
        viewModel.showLoadingIndicator = { [weak self] isLoading in
            if isLoading {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.updateAdvertisementForIndex = { [weak self] index in
            self?.collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
        }
    }
}

// MARK: - UICollectionViewDataSource

extension MainCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.advertisementList?.advertisements.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(MainCollectionViewCell.self, indexPath)
        if let advertisement = viewModel.advertisementList?.advertisements[indexPath.item] {
            cell.configure(with: advertisement)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MainCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectAdvertisementWith(indexPath.item)
    }
}


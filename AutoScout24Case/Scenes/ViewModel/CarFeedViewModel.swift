//
//  CarFeedViewModel.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import Foundation
import RemoteDataProvider
import Util

class CarFeedViewModel: BaseViewModel {
    
    weak var view: CarFeedViewInterface?
    
    private var cars: [CarResult] = [] {
        didSet {
            view?.updateTableView()
        }
    }
    
    func viewDidLoad() {
        fetchCarFeed()
    }
    
    var carCellViewModels: [CarCellViewModel] {
        cars.compactMap {
            CarCellViewModel(car: $0)
        }
    }
    
    var numberOfRows: Int {
        carCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CarCellViewModel? {
        carCellViewModels[safe: indexPath.row]
    }
    
    func car(at indexPath: IndexPath) -> CarResult? {
        cars[safe: indexPath.row]
    }
}

// MARK: Network
extension CarFeedViewModel {
    func fetchCarFeed() {
        let request = CarRequest()
        
        remoteProvider.request(for: request) { [weak self] result in
            switch result {
            case .success(let response):
                self?.cars = response
            case .failure(let error):
                self?.view?.presentAlert(message: error.localizedDescription)
            }
        }
    }
}

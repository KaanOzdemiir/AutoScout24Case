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
    
    private var filteredCars: [CarResult] = []
    
    var isFiltering = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.view?.updateTableView()
            }
        }
    }
    
    func viewDidLoad() {
        fetchCarFeed()
    }
    
    var carCellViewModels: [CarCellViewModel] {
        (isFiltering ? filteredCars : cars).compactMap {
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
        isFiltering ? filteredCars[safe: indexPath.row] : cars[safe: indexPath.row]
    }
    
    func filter(by text: String?) {
        guard !text.orEmpty else {
            isFiltering = false
            return
        }
        isFiltering = true
        // Debouncer could use
        filteredCars = cars.filter {
            [
                $0.mileage?.stringValue,
                $0.fuel,
                $0.description,
                $0.model,
                $0.make,
                $0.colour,
                $0.seller?.city
            ]
            .compactMap { $0 }
            .joined(separator: ", ")
            .contains(text!)
        }
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

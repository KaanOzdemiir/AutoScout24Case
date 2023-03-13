//
//  CarDetailViewModel.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import RemoteDataProvider
import UIKit

final class CarDetailViewModel: BaseViewModel {
    
    weak var view: CarDetailViewInterface?
    
    var car: CarResult
    
    var currentPage: Int = 0
    
    init(car: CarResult) {
        self.car = car
    }
    
    var titleText: String? {
        car.description
    }
    
    var makeAndModelText: String? {
        [car.make, car.model].compactMap {
            $0
        }.joined(separator: " - ")
    }
    
    var localitonText: String? {
        car.seller?.city
    }
    
    var fuelText: String? {
        car.fuel
    }
    
    var millageText: String? {
        if let millage = car.mileage {
            return "\(millage) mi"
        }
        return nil
    }
    
    var priceText: String? {
        if let price = car.price {
            return "$ \(price.stringValue)"
        }
        return nil
    }
    
    var pageText: String? {
        "\(currentPage)/\(numberOfItems)"
    }
    
    var carImageCellViewModels: [CarImageCellViewModel] {
        car.images?.compactMap {
            CarImageCellViewModel(image: $0)
        } ?? []
    }
    
    var numberOfItems: Int {
        carImageCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CarImageCellViewModel? {
        carImageCellViewModels[safe: indexPath.item]
    }
    
    func viewDidLoad() {
        view?.updateViews()
    }
    
    func sizeForItem(at indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 32
        return CGSize(width: width, height: imageCollectionViewHeight)
    }
    
    var imageCollectionViewHeight: CGFloat {
        240
    }
}

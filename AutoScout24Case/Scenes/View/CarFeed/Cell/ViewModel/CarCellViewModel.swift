//
//  CarCellViewModel.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import RemoteDataProvider
import Util
import Kingfisher

class CarCellViewModel: BaseCellViewModel {
    
    var car: CarResult
    
    init(car: CarResult) {
        self.car = car
    }
    
    var makeAndModelText: String? {
        [car.make, car.model].compactMap {
            $0
        }.joined(separator: " - ")
    }
    
    var titleText: String? {
        car.description
    }
    
    var fuleText: String? {
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
    
    var firstImageResource: ImageResource? {
        if let downloadURL = car.images?.first?.url.toURL {
            return ImageResource(downloadURL: downloadURL)
        }
        return nil
    }
    
    var defaultCarImageName: String {
        "questionmark.app.fill"
    }
}

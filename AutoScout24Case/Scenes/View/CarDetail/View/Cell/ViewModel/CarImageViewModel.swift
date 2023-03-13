//
//  CarImageViewModel.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import RemoteDataProvider
import Kingfisher

final class CarImageCellViewModel: BaseViewModel {
    
    var image: CarImage
    
    init(image: CarImage) {
        self.image = image
    }
    
    var imageResource: ImageResource? {
        if let downloadURL = image.url.toURL {
            return ImageResource(downloadURL: downloadURL)
        }
        return nil
    }
}

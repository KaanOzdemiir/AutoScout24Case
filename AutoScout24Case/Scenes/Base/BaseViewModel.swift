//
//  BaseViewModel.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import Foundation
import RemoteDataProvider

class BaseViewModel {
    
    var remoteProvider: DataProviderProtocol
    
    init(remoteProvider: DataProviderProtocol = RemoteDataProvider.shared) {
        self.remoteProvider = remoteProvider
    }
}

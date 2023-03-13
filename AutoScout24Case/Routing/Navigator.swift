//
//  Navigator.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import UIKit

protocol Navigator {
    func navigate()
}

class AppNavigator: Navigator {
    func navigate() {
        guard let window = UIApplication.shared.windows.first else { return }
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            UIView.performWithoutAnimation {
                let viewModel = CarFeedViewModel()
                let rootController = CarFeedController(viewModel: viewModel)
                window.rootViewController = UINavigationController(rootViewController: rootController)
            }
        })
        window.makeKeyAndVisible()
    }
}

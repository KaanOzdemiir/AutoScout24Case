//
//  CarFeedController.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import UIKit

final class CarFeedController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

}

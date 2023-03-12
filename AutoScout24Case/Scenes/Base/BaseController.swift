//
//  BaseController.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit

class BaseController<V: BaseViewModel>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    func configureViews() { }
}

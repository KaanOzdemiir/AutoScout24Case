//
//  BaseCollectionViewCell.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit

class BaseCollectionViewCell<V: BaseViewModel>: UICollectionViewCell {
    var viewModel: V? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    func updateViews() { }
    
    func configureViews() { }
}

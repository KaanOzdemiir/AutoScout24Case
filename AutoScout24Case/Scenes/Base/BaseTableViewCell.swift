//
//  BaseTableViewCell.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit

class BaseTableViewCell<V: BaseCellViewModel>: UITableViewCell {
    
    var viewModel: V? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        configureViews()
    }
    
    func updateViews() { }
    
    func configureViews() { }
}

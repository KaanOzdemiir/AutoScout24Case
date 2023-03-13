//
//  CarImageCell.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit
import Kingfisher

final class CarImageCell: BaseCollectionViewCell<CarImageCellViewModel> {

    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func updateViews() {
        guard let viewModel = viewModel else { return }
        imageView.kf.setImage(with: viewModel.imageResource)
    }
    
    override func configureViews() {
        imageView.contentMode = .scaleAspectFit
    }
}

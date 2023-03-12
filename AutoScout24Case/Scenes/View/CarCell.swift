//
//  CarCell.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit
import Kingfisher

final class CarCell: BaseTableViewCell<CarCellViewModel> {

    @IBOutlet private weak var makeAndModelLabel: UILabel!
    @IBOutlet private weak var carImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var millageLabel: UILabel!
    @IBOutlet private weak var fuelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureViews()
    }
    
    override func updateViews() {
        guard let viewModel = viewModel else { return }
        if let imageResource = viewModel.firstImageResource {
            carImageView.kf.setImage(with: imageResource)
        } else {
            carImageView.image = UIImage(systemName: viewModel.defaultCarImageName)
        }
        makeAndModelLabel.text = viewModel.makeAndModelText
        titleLabel.text = viewModel.titleText
        millageLabel.text = viewModel.millageText
        fuelLabel.text = viewModel.fuleText
        priceLabel.text = viewModel.priceText
    }
    
    override func configureViews() {
        carImageView.contentMode = .scaleAspectFit
    }
}

//
//  CarDetailController.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit
import Util

protocol CarDetailViewInterface: AnyObject {
    func viewDidLoad()
    func updateViews()
}

final class CarDetailController: BaseController<CarDetailViewModel>, CarDetailViewInterface {

    @IBOutlet private weak var imageCollectionView: UICollectionView!
    @IBOutlet private weak var imageCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var makeAndModelLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var fuelLabel: UILabel!
    @IBOutlet private weak var millageLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var pageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }

    override func configureViews() {
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        imageCollectionView.isPagingEnabled = true
        imageCollectionView.showsHorizontalScrollIndicator = false
        imageCollectionView.register(cell: CarImageCell.self)
    }
    
    func updateViews() {
        imageCollectionViewHeight.constant = viewModel.imageCollectionViewHeight
        imageCollectionView.reloadData()
        titleLabel.text = viewModel.titleText
        makeAndModelLabel.text = viewModel.makeAndModelText
        locationLabel.text = viewModel.localitonText
        fuelLabel.text = viewModel.fuelText
        millageLabel.text = viewModel.millageText
        priceLabel.text = viewModel.priceText
    }
    
    private func updatePageLabel() {
        pageLabel.text = viewModel.pageText
    }
}

extension CarDetailController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cell: CarImageCell.self, for: indexPath)
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}

extension CarDetailController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = UIScreen.main.bounds.width - 32
        let horizontalCenter = width / 2
        
        viewModel.currentPage = Int(offSet + horizontalCenter) / Int(width)
        updatePageLabel()
    }
}

extension CarDetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.sizeForItem(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

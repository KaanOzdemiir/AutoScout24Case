//
//  CarFeedController.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import UIKit
import Util

protocol CarFeedViewInterface: AnyObject {
    func viewDidLoad()
    func presentAlert(message: String)
    func updateTableView()
}

final class CarFeedController: BaseController<CarFeedViewModel>, CarFeedViewInterface {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    override func configureViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: CarCell.self)
        tableView.separatorStyle = .none
    }
    
    func presentAlert(message: String) {
        
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
    
}

extension CarFeedController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: CarCell.self, for: indexPath)
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
}

extension CarFeedController: UITableViewDelegate {
}

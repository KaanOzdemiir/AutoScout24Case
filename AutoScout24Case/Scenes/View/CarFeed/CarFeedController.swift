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

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
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
        
        searchBar.delegate = self
    }
    
    func presentAlert(message: String) {
        AlertHelper(message: "Something went wrong", actions: [
            UIAlertAction(title: "OK", style: .default)
        ])
        .present()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let car = viewModel.car(at: indexPath) {
            let viewModel = CarDetailViewModel(car: car)
            let controller = CarDetailController(viewModel: viewModel)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension CarFeedController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filter(by: searchBar.text)
    }
}

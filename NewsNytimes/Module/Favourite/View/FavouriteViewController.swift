//
//  FavouriteViewController.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    var viewModel: FavouriteViewModelProtocol!

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(type: FavouriteTableViewCell.self)
            tableView.backgroundColor = .clear
            tableView.rowHeight = 60
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.delegate = self
        self.view.backgroundColor = .systemPink
    }


}

extension FavouriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.countFavourites
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueCell(withType: FavouriteTableViewCell.self, for: indexPath) as? FavouriteTableViewCell else { return UITableViewCell() }
        
        let model = self.viewModel.itemForTable(index: indexPath.row)
        cell.configure(model: model)
        
        return cell
    }
    
    
}

extension FavouriteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        self.viewModel.deleteFauvorite(index: indexPath.row)
    }
}

extension FavouriteViewController: FavouriteViewModelDelegate {
    
    func didFetchData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

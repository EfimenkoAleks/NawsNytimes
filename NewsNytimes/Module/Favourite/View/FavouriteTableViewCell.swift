//
//  FavouriteTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import UIKit
import CoreData

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet private weak var abstractLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
        self.backgroundColor = .gray
    }
    
    func configure(model: NSManagedObject) {
        let title = model.value(forKey: "title") as? String ?? "N/A"
        self.abstractLabel.text = title
    }
    
}

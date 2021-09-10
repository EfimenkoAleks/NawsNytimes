//
//  FavouriteTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import UIKit
import CoreData

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var abstractLabel: UILabel!
   
    func configure(model: NSManagedObject) {
        let title = model.value(forKey: "title") as? String ?? "N/A"
        self.abstractLabel.text = title
    }
    
}

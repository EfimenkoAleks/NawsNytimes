//
//  ViewedTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//
import UIKit

class ViewedTableViewCell: UITableViewCell {
 
    @IBOutlet weak var statImageView: UIImageView!
    
    @IBOutlet weak var emailTextLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
        let image = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        self.statImageView.image = image
        self.statImageView.tintColor = .yellow
    }

    func configure(model: Emailed) {
        self.emailTextLabel.text = model.title
    }
    
}

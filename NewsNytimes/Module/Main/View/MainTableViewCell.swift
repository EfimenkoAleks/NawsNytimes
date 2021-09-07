//
//  MainTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var statImageView: UIImageView!
    @IBOutlet private weak var articleTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let image = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        self.statImageView.image = image
        self.statImageView.tintColor = .yellow
    }

    func configure(text: String) {
        self.articleTextLabel.text = text
    }
    
}

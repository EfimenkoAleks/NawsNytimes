//
//  EmailTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit
import CoreData

class EmailTableViewCell: UITableViewCell {
   
    @IBOutlet weak var tapButton: UIButton!
    
    @IBOutlet weak var emailTextLabel: UILabel!
    
    weak var delegate: CellButtonDelegate?
    private var article: Articles?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        let image = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        self.tapButton.contentEdgeInsets = .zero
        self.tapButton.setImage(image, for: .normal)
        self.tapButton.tintColor = .systemGray2
        
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        guard let id = self.article?.id else { return }
        self.delegate?.addFavourites(index: id)
    }

    func configure(model: Articles) {
        self.emailTextLabel.text = model.title
        self.article = model
    }
    
}

//
//  EmailTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit
import CoreData

class EmailTableViewCell: UITableViewCell {
   
    @IBOutlet private weak var tapButton: UIButton!
    
    @IBOutlet private weak var emailTextLabel: UILabel!
    
    weak var delegate: CellButtonDelegate?
    private var article: Articles?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .gray
        let image = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withRenderingMode(.alwaysTemplate)
        self.tapButton.contentEdgeInsets = .zero
        self.tapButton.setImage(image, for: .normal)
        self.tapButton.tintColor = .gray
        
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

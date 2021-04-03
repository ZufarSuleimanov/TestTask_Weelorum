//
//  ItemCell.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 01.04.2021.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var imageItemImageView: UIImageView!
    @IBOutlet weak var nameItemTextView: UITextView!
    @IBOutlet weak var priceItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = #colorLiteral(red: 0.9000416994, green: 0.659925282, blue: 0.1484854519, alpha: 1)
    }

    
    func set(object: Item) {
        
        self.nameItemTextView.text = object.name
        self.priceItemLabel.text = String(object.price)
        self.imageItemImageView.getImage(urlString: object.urlImage)
        
    }

}



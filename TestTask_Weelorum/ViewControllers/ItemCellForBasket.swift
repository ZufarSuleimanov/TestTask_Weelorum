//
//  ItemCellForBasket.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 03.04.2021.
//

import UIKit

class ItemCellForBasket: UITableViewCell {

    @IBOutlet weak var imageItemImageView: UIImageView!
    @IBOutlet weak var nameItemLabel: UILabel!
    @IBOutlet weak var sumItemLabel: UILabel!
    @IBOutlet weak var quantityItemLabel: UILabel!
    
    func setCell(object: ItemForBasket) {
        self.imageItemImageView.getImage(urlString: object.urlImage!)
        self.nameItemLabel.text = object.name
        self.sumItemLabel.text = String(object.sum)
        self.quantityItemLabel.text = String(object.quantity)
    }
    
}

//
//  ItemModelForBasket.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 03.04.2021.
//

import RealmSwift

class ItemForBasket: Object {

    @objc dynamic var name = ""
    @objc dynamic var sum: Int = 0
    @objc dynamic var quantity: Int = 0
    @objc dynamic var urlImage: String?
    
    convenience init(name: String, sum: Int, quantity: Int, urlImage: String?) {
        self.init()
        self.name = name
        self.sum = sum
        self.quantity = quantity
        self.urlImage = urlImage
    }

}

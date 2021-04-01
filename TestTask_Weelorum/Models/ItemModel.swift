//
//  ItemModel.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 01.04.2021.
//

import UIKit


struct Item: Codable {
    var name: String
    var price: Int
    var urlImage: String
    var image: UIImage? {
        let data = try? Data(contentsOf: URL(string: urlImage)!)
        return UIImage(data: data!)!
    }
}

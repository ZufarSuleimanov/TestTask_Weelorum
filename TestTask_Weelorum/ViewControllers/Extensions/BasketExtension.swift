//
//  BasketExtension.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 03.04.2021.
//

import UIKit
import RealmSwift

extension BasketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
}

extension BasketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.itemCellForBasket.rawValue, for: indexPath) as! ItemCellForBasket
        let item = items[indexPath.row]
        cell.setCell(object: item)
        
        total = total + item.sum
        totalLabel.text = String(total)
        
        return cell
    }
    
}



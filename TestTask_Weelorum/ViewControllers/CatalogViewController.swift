//
//  CatalogViewController.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 02.04.2021.
//

import UIKit



class CatalogViewController: UIViewController {
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    @IBOutlet weak var sortingSegmentedControl: UISegmentedControl!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = LocalHandler.getStoreList() ?? []
        
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        self.itemCollectionView.register(UINib.init(nibName: XIBs.itemCell.rawValue, bundle: nil), forCellWithReuseIdentifier: Cells.itemCell.rawValue)
        self.itemCollectionView.reloadData()
    }
    
    @IBAction func sorting(_ sender: UISegmentedControl) {
        
        if sortingSegmentedControl.selectedSegmentIndex == 0 {
            items =  items.sorted{ $0.price < $1.price }
        } else {
            items = items.sorted{ $0.price > $1.price }
        }
        
        itemCollectionView.reloadData()
    }
}


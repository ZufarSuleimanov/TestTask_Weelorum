//
//  BasketViewController.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 03.04.2021.
//

import UIKit
import RealmSwift
import Firebase

class BasketViewController: UIViewController {

    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    var total: Int = 0
    var items: Results<ItemForBasket>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        basketTableView.delegate = self
        basketTableView.dataSource = self
        basketTableView.register( UINib.init(nibName: XIBs.itemCellForBasket.rawValue, bundle: nil), forCellReuseIdentifier: Cells.itemCellForBasket.rawValue)

        items = realm.objects(ItemForBasket.self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        total = 0
        totalLabel.text = "0"
        basketTableView.reloadData()
    }
    
    @IBAction func exit(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
            let storyboard = UIStoryboard(name: Storyboards.authorization.rawValue, bundle: nil)
            let testAuthView = storyboard.instantiateViewController(withIdentifier: ViewControllers.authorization.rawValue)
            testAuthView.modalPresentationStyle = .fullScreen
            present(testAuthView, animated: true)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func buy(_ sender: UIButton) {
        
        for item in items {
            StorageHandler.deleteObject(item)
        }
        total = 0
        totalLabel.text = "0"
        basketTableView.reloadData()
        triggerNotification()

    }
    
    private func triggerNotification(){
        let alertController = UIAlertController(title: "Заказ принят!", message: "Спасибо за покупку.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Закрыть", style: .default)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
}

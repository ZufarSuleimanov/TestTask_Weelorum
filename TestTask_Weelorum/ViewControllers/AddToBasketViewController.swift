//
//  AddToBasketViewController.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 02.04.2021.
//

import UIKit

class AddToBasketViewController: UIViewController {
    
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var reduceButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var addToBasketButton: UIButton!
    var urlImage: String = ""
    var name: String = ""
    var price = 0
    var quantity = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeInterface()
        
    }
    
    func customizeInterface() {
        
        addToBasketButton.isEnabled = false
        reduceButton.isEnabled = false
        quantityTextField.text = "0"
        reduceButton.layer.cornerRadius = 15
        increaseButton.layer.cornerRadius = 15
        imageImageView.image = getImage()
        
    }
    
    func getImage() -> UIImage {
        
        let data = try? Data(contentsOf: URL(string: urlImage)!)
        return UIImage(data: data!)!
        
    }
    
    @IBAction func reduce(_ sender: UIButton) {
        
        if quantityTextField.text != "0" {
            quantity = quantity - 1
            totalAmountLabel.text = "\(price * quantity)"
            quantityTextField.text = String(quantity)
            
            if quantity == 0 {
                addToBasketButton.isEnabled = false
                reduceButton.isEnabled = false
            }
        }
        
    }
    
    @IBAction func increase(_ sender: UIButton) {
        
        quantity = quantity + 1
        totalAmountLabel.text = "\(price * quantity)"
        quantityTextField.text = String(quantity)
        
        if quantity == 1 {
            addToBasketButton.isEnabled = true
            reduceButton.isEnabled = true
        }
        
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) { dismiss(animated: true) }
    
    @IBAction func addToBasket(_ sender: UIButton) { dismiss(animated: true) }
    
}

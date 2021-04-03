//
//  ImageExtension.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 03.04.2021.
//

import UIKit

extension UIImageView {
    
    func getImage(urlString:String) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
                
                guard let data = data , error == nil, let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async { () -> Void in
                    self.image = image
                }
            }).resume()
        }
    }
    
}

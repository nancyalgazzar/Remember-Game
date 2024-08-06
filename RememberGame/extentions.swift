//
//  extentions.swift
//  lec12
//
//  Created by 1234 on 18/07/2024.
//

import UIKit
extension UIViewController {
    
    func alertMessage( title: String, message: String){
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        
        present(alert, animated: true)
    }
}

//
//  PresentAlert.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 15.09.2023.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String?) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

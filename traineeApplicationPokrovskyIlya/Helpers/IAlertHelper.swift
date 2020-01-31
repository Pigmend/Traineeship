//
//  IAlertService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit

protocol IAlertHelper: class {
    func showError(message: String)
    func showAlert(title: String, message: String)
    func showAlert(title: String?, message: String?, completion: Completion)
}

extension IAlertHelper where Self: UIViewController {
    
    func showError(message: String) {
        let title = "Error"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    func showAlert(title: String? = nil, message: String? = nil, completion: Completion) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let agreeAction = UIAlertAction(title: "Agree", style: .default, handler: { _ in
            completion?()
        })

        alert.addAction(cancelAction)
        alert.addAction(agreeAction)
        present(alert, animated: true)
    }
}

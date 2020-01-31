//
//  EmailEntryViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 13.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import FirebaseUI

class EmailEntryViewController: FUIEmailEntryViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - @Actions
    @IBAction func nextButton(_ sender: Any) {
        guard let emailText = emailTextField.text else { return }
        onNext(emailText)
    }
    
    @IBAction func onChanged() {
        guard let emailText = emailTextField.text else { return }
        didChangeEmail(emailText)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        onBack()
    }
    
}

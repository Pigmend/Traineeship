//
//  PasswordRecoveryViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 14.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class PasswordRecoveryViewController: FUIPasswordRecoveryViewController {

    // MARK: - Properties
    private var mail: String?
    
    var unwrappedMail: String {
        guard let email = emailTextField.text else { return "" }
        return email
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - init
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, authUI: FUIAuth, email: String) {
        mail = email
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil, authUI: authUI, email: email)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTextField.text = mail
    }
    
    // MARK: - IBAction

    @IBAction func resetPusswordButtonPressed(_ sender: UIButton) {
        recoverEmail(unwrappedMail)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

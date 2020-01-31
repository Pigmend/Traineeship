//
//  PasswordSignUpViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 15.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class PasswordSignUpViewController: FUIPasswordSignUpViewController {

    // MARK: - Properties
    private var mail: String?
    private let usersRepository = RealtimeDatabaseUsersRepository()
    
    var unwrappedMail: String {
        guard let email = emailTextField.text else { return "" }
        return email
    }
    
    var unwrappedPassword: String {
        guard let password = passwordTextField.text else { return "" }
        return password
    }
    
    var unwrappedUsername: String {
        guard let username = usernameTextField.text else { return "" }
        return username
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTextField.text = mail
        super.viewWillAppear(animated)
    }

    // MARK: - IBActions
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        signUp(withEmail: unwrappedMail, andPassword: unwrappedPassword, andUsername: unwrappedUsername)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        onBack()
    }
    
}

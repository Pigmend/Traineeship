//
//  ChangePasswordViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangePasswordViewProtocol: class {
    
    var userInteractionEnabled: Bool { get set }
    var loaderView: ILoader? { get }
    var oldPassword: String? { get set }
    var newPassword: String? { get set }
    var confirmPassword: String? { get set }
}

class ChangePasswordViewController: UIViewController, ViperView, IAlertHelper {
    weak var presenter: ChangePasswordPresenterProtocol!
    var loader: ILoader!
    
    // MARK: - IBOutlets
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func changePasswordButtonPressed(_ sender: UIButton) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        presenter.changePasswordAction()
    }
}

// MARK: - ChangePasswordViewController+ChangePasswordViewProtocol
extension ChangePasswordViewController: ChangePasswordViewProtocol {
    
    var userInteractionEnabled: Bool {
        get {
            return self.view.isUserInteractionEnabled
        }
        set {
            self.view.isUserInteractionEnabled = newValue
        }
    }
    
    var loaderView: ILoader? {
        return self.loader
    }
    
    var oldPassword: String? {
        get {
            return oldPasswordTextField.text
        }
        set {
            oldPasswordTextField.text = newValue
        }
    }
    
    var newPassword: String? {
        get {
            return newPasswordTextField.text
        }
        set {
            newPasswordTextField.text = newValue
        }
    }
    
    var confirmPassword: String? {
        get {
            return confirmPasswordTextField.text
        }
        set {
            confirmPasswordTextField.text = newValue
        }
    }
}

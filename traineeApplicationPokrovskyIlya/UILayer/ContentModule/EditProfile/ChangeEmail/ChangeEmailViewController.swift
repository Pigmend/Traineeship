//
//  ChangeEmailViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangeEmailViewProtocol: class {
    
    var userInteractionEnabled: Bool { get set }
    var loaderView: ILoader? { get }
    var oldEmail: String? { get set }
    var newEmail: String? { get set }
    var password: String? { get set }
}

class ChangeEmailViewController: UIViewController, ViperView, IAlertHelper {
    weak var presenter: (ChangeEmailPresenterProtocol & IViewLifeCycle)!
    
    var loader: ILoader!
    
    // MARK: - IBOutlets
    @IBOutlet weak var oldEmailLabel: UILabel!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear?()
    }
    
    // MARK: - IBActions
    @IBAction func changeEmailButtonPressed(_ sender: UIButton) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        presenter.changeEmailAction()
    }
}

// MARK: - ChangeEmailViewController+ChangeEmailViewProtocol
extension ChangeEmailViewController: ChangeEmailViewProtocol {
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
    
    var oldEmail: String? {
        get {
            return oldEmailLabel.text
        }
        set {
            oldEmailLabel.text = newValue
        }
    }
    
    var newEmail: String? {
        get {
            return newEmailTextField.text
        }
        set {
            newEmailTextField.text = newValue
        }
    }
    
    var password: String? {
        get {
            return passwordTextField.text
        }
        set {
            passwordTextField.text = newValue
        }
    }
}

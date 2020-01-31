//
//  ChangeEmailPresenter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangeEmailPresenterProtocol: class {
    func changeEmailAction()
}

final class ChangeEmailPresenter: ViperPresenter {
    weak var view: (ChangeEmailViewProtocol & IAlertHelper)!
    weak var interactor: ChangeEmailInteractorProtocol!
    weak var router: ChangeEmailRouterProtocol!
}

extension ChangeEmailPresenter: IViewLifeCycle {
    func viewWillAppear() {
        self.view.oldEmail = self.interactor.getEmail()
    }
}

extension ChangeEmailPresenter: ChangeEmailPresenterProtocol {
    func changeEmailAction() {
        let emailValidator = Validator.isValidEmailAdress(view.newEmail)
        if emailValidator != nil {
            view.showError(message: emailValidator!)
            return
        }
        
        let passwordValidator = Validator.validatePassword(view.password)
        if passwordValidator != nil {
            view.showError(message: passwordValidator!)
            return
        }
        
        view.loaderView?.showLoader()
        interactor.changeMail(newEmail: view.newEmail!, password: view.password!, completionHandler: {(error) in
            if error != nil {
                self.view.showError(message: error!.localizedDescription)
                self.view.loaderView?.showErrorHUD()
            } else {
                self.view.userInteractionEnabled = false
                self.view.loaderView?.showSuccess()
                self.router.back()
            }
        })
    }
    
}

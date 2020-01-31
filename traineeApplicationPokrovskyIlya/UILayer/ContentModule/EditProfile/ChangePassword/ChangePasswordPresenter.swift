//
//  ChangePasswordPresenter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangePasswordPresenterProtocol: class {
    func changePasswordAction()
}

final class ChangePasswordPresenter: ViperPresenter {
    weak var view: (ChangePasswordViewProtocol & IAlertHelper)!
    weak var interactor: ChangePasswordInteractorProtocol!
    weak var router: ChangePasswordRouterProtocol!
}

extension ChangePasswordPresenter: ChangePasswordPresenterProtocol {
    func changePasswordAction() {
        let oldPasswordValidator = Validator.validatePassword(view.oldPassword)
        if oldPasswordValidator != nil {
            view.showError(message: oldPasswordValidator!)
            view.loaderView?.showErrorHUD()
            return
        }
        
        let newPasswordValidator = Validator.validatePassword(view.newPassword, view.confirmPassword)
        if newPasswordValidator != nil {
            view.showError(message: newPasswordValidator!)
            view.loaderView?.showErrorHUD()
            return
        }
        
        view.loaderView?.showLoader()
        interactor.changePassword(oldPassword: view.oldPassword!, newPassword: view.newPassword!, confitmPassword: view.confirmPassword!) { (error) in
            if error != nil {
                self.view.showError(message: error!.localizedDescription)
                self.view.loaderView?.showErrorHUD()
            } else {
                self.view.userInteractionEnabled = false
                self.view.loaderView?.showSuccess()
                self.router.back()
            }
        }
    }
    
}

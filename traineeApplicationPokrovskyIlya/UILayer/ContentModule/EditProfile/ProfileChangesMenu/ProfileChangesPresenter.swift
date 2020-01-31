//
//  ProfileChangesPresenter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 22.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import FirebaseStorage
import AppusViper

protocol ProfileChangesPresenterProtocol: class {
    func sideMenuAction()
    func emailAction()
    func passwordAction()
    func photoAction()
    func didPickedPhoto(image: UIImage)
}

final class ProfileChangesPresenter: ViperPresenter {
    weak var view: (ProfileChangesViewProtocol & IAlertHelper)!
    weak var interactor: ProfileChangesInteractorProtocol!
    weak var router: ProfileChangesRouterProtocol!
}

extension ProfileChangesPresenter: IViewLifeCycle {
    
    func viewWillAppear() {
        self.view.email = self.interactor.getEmail()
        self.view.username = self.interactor.getUsername()
        if let url = self.interactor.avatarURL {
            view.setAvatar(from: url)
        } else {
            view.setPlaceholder()
        }
    }
}

extension ProfileChangesPresenter: ProfileChangesPresenterProtocol {
    
    func sideMenuAction() {
        router.showSideMenu()
    }
    
    func emailAction() {
        router.showEmailChangeController()
    }
    
    func passwordAction() {
        router.showPasswordChangeController()
    }
    
    func photoAction() {
        view.showAlert(title: "Change photo", message: "Do you want to change photo?") {
            self.router.showPhotoChangeController()
        }
    }
    
    func didPickedPhoto(image: UIImage) {
        self.view.loaderView?.showLoader()
        interactor.uploadPhoto(image: image) { [weak self] (url, error) in
            guard let strongSelf = self else { return }
            if error != nil {
                strongSelf.view.showError(message: error!.localizedDescription)
                strongSelf.view.loaderView?.showErrorHUD()
            } else {
                strongSelf.view.avatar = image
                strongSelf.interactor.avatarURL = url
                strongSelf.view.loaderView?.showSuccess()
            }
        }
    }
}

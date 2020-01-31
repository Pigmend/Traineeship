//
//  SideMenuPresenter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 18.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol SideMenuPresenterProtocol: class {
    func changeProfileAction()
    func exploreAction()
    func messagesAction()
    func usersAction()
    func postsAction()
    func logoutAction()
}

final class SideMenuPresenter: ViperPresenter {
    weak var view: (SideMenuViewProtocol & IAlertHelper)!
    weak var interactor: SideMenuInteractorProtocol!
    weak var router: SideMenuRouterProtocol!
}

extension SideMenuPresenter: IViewLifeCycle {
    func viewDidLoad() {
        self.view.clearSelected()
        self.view.exploreSelected = true
    }
    
    func viewWillAppear() {
        self.view.userName = self.interactor.userName
        
        if let url = self.interactor.avatarUrl {
            self.view.setAvatar(from: url)
        } else {
            self.view.setPlaceholder()
        }
    }
}

extension SideMenuPresenter: SideMenuPresenterProtocol {
    func changeProfileAction() {
        router.showChangeProfile()
    }
    
    func exploreAction() {
        view.clearSelected()
        view.exploreSelected = true
        router.showExplore()
    }
    
    func messagesAction() {
        view.clearSelected()
        view.massageSelected = true
        router.showMassages()
    }
    
    func usersAction() {
        view.clearSelected()
        view.usersSelected = true
        router.showUsers()
    }
    
    func postsAction() {
        view.clearSelected()
        view.myPostsSelected = true
        router.showPosts()
    }
    
    func logoutAction() {
        let title = "Logout"
        let message = "Do you want to logout?"
        view.showAlert(title: title, message: message) { [unowned self] in
            do {
                self.view.setPlaceholder()
                try self.interactor.logout()
                let authentificationVC = self.interactor.getAuthController()
                self.router.logout(navVC: authentificationVC)
            } catch {
                let logoutMessage = "Logout error, please try again later"
                self.view.showError(message: logoutMessage)
            }
        }
    }
}

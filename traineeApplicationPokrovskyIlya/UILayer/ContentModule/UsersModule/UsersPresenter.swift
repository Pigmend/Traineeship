//
//  UsersPresenter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol UsersPresenterProtocol: class {
    func sideMenuAction()
    func userFor(_ item: IUserViewModel?, at index: Int)
    func numberOfUsers() -> Int
}

final class UsersPresenter: ViperPresenter {
    weak var view: (UsersViewProtocol & IAlertHelper)!
    weak var interactor: UsersInteractorProtocol!
    weak var router: UsersRouterProtocol!
}

// MARK: - UsersPresenter + IViewLifeCycle
extension UsersPresenter: IViewLifeCycle {
    func viewDidLoad() {
        self.view.loaderView.showLoader()
        interactor.getUsers { (error) in
            if error != nil {
                self.view.loaderView.showErrorHUD()
                self.view.showError(message: error!.localizedDescription)
            } else {
                self.view.loaderView.showSuccess()
                self.view.reloadData()
            }
        }
    }
}

// MARK: - UsersPresenter + UsersPresenterProtocol
extension UsersPresenter: UsersPresenterProtocol {
    func sideMenuAction() {
        router.showSideMenu()
    }
    
    func userFor(_ item: IUserViewModel?, at index: Int) {
        guard let user = interactor.collectionData?[index] else { return }
        item?.name = user.name
        guard let userURL = user.imageURL else { return }
        let url = URL(string: userURL)
        item?.avatarImageURL = url
    }
    
    func numberOfUsers() -> Int {
        guard let usersCount = interactor.collectionData?.count else { return 0 }
        return usersCount
    }
    
}

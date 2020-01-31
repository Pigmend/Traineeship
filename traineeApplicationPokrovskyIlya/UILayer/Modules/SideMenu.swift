//
//  SideMenu.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 18.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

class SideMenu: Module<SideMenuViewController, SideMenuPresenter, SideMenuInteractor, SideMenuRouter> {
    init(navigationStackViewController: UINavigationController) {
        super.init()
        self.interactor.userRepository = FirebaseUserRepository()
        self.interactor.authService = FirebaseAuthService()
        
        self.router.navigationStackViewController = navigationStackViewController
    }
}

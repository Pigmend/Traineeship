//
//  Users.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import PKHUD

class Users: Module<UsersViewController, UsersPresenter, UsersInteractor, UsersRouter> {
    override init() {
        super.init()
        self.router.sideMenuRepository = SideMenuRepository()
        self.interactor.usersRepository = RealtimeDatabaseUsersRepository()
        self.view.loader = PKHUD.sharedHUD
    }
}

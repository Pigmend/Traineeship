//
//  ChangePassword.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import PKHUD

class ChangePassword: Module<ChangePasswordViewController, ChangePasswordPresenter, ChangePasswordInteractor, ChangePasswordRouter> {
    override init() {
        super.init()
        self.interactor.userRepository = FirebaseUserRepository()
        self.interactor.profileService = ProfileService()
        self.view.loader = PKHUD.sharedHUD
    }
}

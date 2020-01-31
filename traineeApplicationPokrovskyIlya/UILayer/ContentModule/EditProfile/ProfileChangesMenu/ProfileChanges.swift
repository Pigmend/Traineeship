//
//  ProfileChanges.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 22.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import PKHUD
import AppusViper

class ProfileChanges: Module<ProfileChangesViewController, ProfileChangesPresenter, ProfileChangesInteractor, ProfileChangesRouter> {
    override init() {
        super.init()
        self.router.sideMenuRepository = SideMenuRepository()
        self.interactor.userRepository = FirebaseUserRepository()
        self.interactor.avatarRepository = FirebaseAvatarRepository()
        self.interactor.profileService = ProfileService()
        self.view.loader = PKHUD.sharedHUD
    }
}

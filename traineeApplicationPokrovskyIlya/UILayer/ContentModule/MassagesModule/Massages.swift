//
//  Massages.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

class Massages: Module<MassagesViewController, MassagesPresenter, MassagesInteractor, MassagesRouter> {
    override init() {
        super.init()
        self.router.sideMenuRepository = SideMenuRepository()
    }
}

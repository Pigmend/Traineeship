//
//  ISideMenuRepository.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 21.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import SideMenu

protocol ISideMenuRepository: class {
    func getLeftSideMenu() -> UISideMenuNavigationController?
}

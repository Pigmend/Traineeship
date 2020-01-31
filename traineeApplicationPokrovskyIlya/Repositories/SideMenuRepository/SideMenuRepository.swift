//
//  SideMenuRepository.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 21.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import SideMenu

class SideMenuRepository: ISideMenuRepository {
    func getLeftSideMenu() -> UISideMenuNavigationController? {
        guard let leftMenu = SideMenuManager.default.menuLeftNavigationController else { return nil }
        
        leftMenu.navigationBar.isHidden = true
        
        return leftMenu
    }
}

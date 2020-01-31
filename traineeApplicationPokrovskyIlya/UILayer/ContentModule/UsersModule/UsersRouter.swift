//
//  UsersRouter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol UsersRouterProtocol: class {
    func showSideMenu()
}

final class UsersRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: UsersPresenterProtocol!
    var sideMenuRepository: ISideMenuRepository!
}

extension UsersRouter: UsersRouterProtocol {
    func showSideMenu() {
        guard let sideMenu = sideMenuRepository.getLeftSideMenu() else { return }
        
        viewController.present(sideMenu, animated: true)
    }
}

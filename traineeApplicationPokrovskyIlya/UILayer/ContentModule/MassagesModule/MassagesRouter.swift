//
//  MassagesRouter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol MassagesRouterProtocol: class {
    func showSideMenu()
}

final class MassagesRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: MassagesPresenterProtocol!
    var sideMenuRepository: ISideMenuRepository!
}

extension MassagesRouter: MassagesRouterProtocol {
    func showSideMenu() {
        guard let sideMenu = sideMenuRepository.getLeftSideMenu() else { return }
        
        viewController.present(sideMenu, animated: true)
    }
}

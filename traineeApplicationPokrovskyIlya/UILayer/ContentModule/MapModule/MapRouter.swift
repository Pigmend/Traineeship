//
//  MapRouter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol MapRouterProtocol: class {
    func showSideMenu()
}

final class MapRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: MapPresenterProtocol!
    var sideMenuRepository: ISideMenuRepository!
    
}

extension MapRouter: MapRouterProtocol {
    func showSideMenu() {
        guard let sideMenu = sideMenuRepository.getLeftSideMenu() else { return }
        
        viewController.present(sideMenu, animated: true)
    }
}

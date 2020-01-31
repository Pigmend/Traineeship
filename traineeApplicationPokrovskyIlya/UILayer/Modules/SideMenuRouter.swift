//
//  SideMenuRouter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 18.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol SideMenuRouterProtocol: class {
    func showChangeProfile()
    func showExplore()
    func showMassages()
    func showUsers()
    func showPosts()

    func logout(navVC: UINavigationController)
}

final class SideMenuRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var navigationStackViewController: UINavigationController!
    weak var presenter: SideMenuPresenterProtocol!
}

extension SideMenuRouter: SideMenuRouterProtocol {
    
    func showChangeProfile() {
        self.viewController.dismiss(animated: true, completion: nil)
        let controller = ProfileChanges()
        controller.view.sideMenuDelegate = viewController as? ISideMenuDelegate
        navigationStackViewController.viewControllers = [controller.view]
    }
    
    func showExplore() {
        self.viewController.dismiss(animated: true, completion: nil)
        navigationStackViewController.viewControllers = [Map().view]
    }
    
    func showMassages() {
        self.viewController.dismiss(animated: true, completion: nil)
        navigationStackViewController.viewControllers = [Massages().view]
    }
    
    func showUsers() {
        self.viewController.dismiss(animated: true, completion: nil)
        navigationStackViewController.viewControllers = [Users().view]
    }
    
    func showPosts() {
        self.viewController.dismiss(animated: true, completion: nil)
        navigationStackViewController.viewControllers = [Posts().view]
    }
    
    func logout(navVC: UINavigationController) {
        navigationStackViewController.viewControllers = [Map().view]
        viewController.present(navVC, animated: true, completion: nil)
    }
}

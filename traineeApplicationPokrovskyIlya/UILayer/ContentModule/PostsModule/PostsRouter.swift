//
//  PostsRouter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol PostsRouterProtocol: class {
    func showSideMenu()
}

final class PostsRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: PostsPresenterProtocol!
    var sideMenuRepository: ISideMenuRepository!
}

extension PostsRouter: PostsRouterProtocol {
    func showSideMenu() {
        guard let sideMenu = sideMenuRepository.getLeftSideMenu() else { return }
        
        viewController.present(sideMenu, animated: true)
    }
}

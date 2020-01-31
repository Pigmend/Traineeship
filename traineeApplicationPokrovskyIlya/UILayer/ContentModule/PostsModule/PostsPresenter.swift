//
//  PostsPresenter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol PostsPresenterProtocol: class {
    func sideMenuAction()
}

final class PostsPresenter: ViperPresenter {
    weak var view: PostsViewProtocol!
    weak var interactor: PostsInteractorProtocol!
    weak var router: PostsRouterProtocol!
}

extension PostsPresenter: PostsPresenterProtocol {
    func sideMenuAction() {
        router.showSideMenu()
    }
    
}

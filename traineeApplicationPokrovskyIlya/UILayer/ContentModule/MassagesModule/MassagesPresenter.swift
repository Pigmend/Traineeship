//
//  MassagesPresenter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol MassagesPresenterProtocol: class {
    func sideMenuAction()
}

final class MassagesPresenter: ViperPresenter {
    weak var view: MassagesViewProtocol!
    weak var interactor: MassagesInteractorProtocol!
    weak var router: MassagesRouterProtocol!
}

extension MassagesPresenter: MassagesPresenterProtocol {
    func sideMenuAction() {
        router.showSideMenu()
    }

}

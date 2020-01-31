//
//  ChangePasswordRouter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangePasswordRouterProtocol: class {
    func back()
}

final class ChangePasswordRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: ChangePasswordPresenterProtocol!
}

extension ChangePasswordRouter: ChangePasswordRouterProtocol {
    func back() {
        viewController.navigationController?.popViewController(animated: true)
    }
}

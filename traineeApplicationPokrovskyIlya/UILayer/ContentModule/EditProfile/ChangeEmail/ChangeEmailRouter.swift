//
//  ChangeEmailRouter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangeEmailRouterProtocol: class {
    func back()
}

final class ChangeEmailRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: ChangeEmailPresenterProtocol!
}

extension ChangeEmailRouter: ChangeEmailRouterProtocol {
    func back() {
        viewController.navigationController?.popViewController(animated: true)
    }
}

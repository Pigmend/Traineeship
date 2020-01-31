//
//  IHudService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 02.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import PKHUD

protocol ILoader: class {
    func showLoader()
    func showErrorHUD()
    func showSuccess()
}

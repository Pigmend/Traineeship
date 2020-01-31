//
//  PKHUD+ILoader.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 02.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import PKHUD

extension PKHUD: ILoader {
    func showLoader() {
        HUD.show(.progress)
    }
    
    func showErrorHUD() {
        HUD.flash(.error, delay: 2.0)
    }
    
    func showSuccess() {
        HUD.flash(.success, delay: 2.0)
    }
}

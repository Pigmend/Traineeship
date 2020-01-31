//
//  AuthPickerViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 13.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import FirebaseUI

class AuthPickerViewController: FUIAuthPickerViewController {

    init(forAuthUI: FUIAuth) {
        super.init(nibName: nil, bundle: nil, authUI: forAuthUI)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

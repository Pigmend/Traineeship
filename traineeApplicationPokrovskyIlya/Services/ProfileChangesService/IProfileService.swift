//
//  IProfileService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 05.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

protocol IProfileService: class {
    func changePassword(to newPassword: String, with currentPassword: String, completion: CompletionHandler)
    func changeEmail(to newEmail: String, with currentPassword: String, completion: CompletionHandler)
}

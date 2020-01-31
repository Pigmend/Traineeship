//
//  IFirebaseService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 22.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//
import Firebase
import FirebaseUI
import UIKit

protocol IAuthService: class {
    func getAuthController() -> UINavigationController
    func isLoggedIn() -> Bool
    func logout() throws
}

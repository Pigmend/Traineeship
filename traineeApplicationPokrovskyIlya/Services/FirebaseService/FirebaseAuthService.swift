//
//  LoginService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 22.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import Firebase
import FirebaseUI
import SideMenu

class FirebaseAuthService: IAuthService {
    private var auth = FUIAuth.defaultAuthUI()
    
    func getAuthController() -> UINavigationController {
        guard let authVC = self.auth?.authViewController() else { fatalError() }
        authVC.modalPresentationStyle = .fullScreen
        authVC.navigationBar.isHidden = true
        
        return authVC
        
    }
    
    func isLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func logout() throws {
        try self.auth?.signOut()
    }
    
}

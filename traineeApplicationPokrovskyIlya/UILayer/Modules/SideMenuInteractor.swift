//
//  SideMenuInteractor.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 18.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol SideMenuInteractorProtocol: class {
    var userName: String? { get set }
    var avatarUrl: URL? { get set }
    
    func getAuthController() -> UINavigationController
    func logout() throws
}

final class SideMenuInteractor: ViperInteractor {
    weak var presenter: SideMenuPresenterProtocol!
    var userRepository: ICurrentUserRepository!
    var authService: IAuthService!
}

extension SideMenuInteractor: SideMenuInteractorProtocol {
    
    var userName: String? {
        get {
            return self.userRepository.userName
        }
        set {
            self.userRepository.userName = newValue
        }
    }
    
    var avatarUrl: URL? {
        get {
            return self.userRepository.avatarUrl
        }
        set {
            self.userRepository.avatarUrl = newValue
        }
    }
    
    func getAuthController() -> UINavigationController {
        return authService.getAuthController()
    }
    
    func logout() throws {
        try self.authService.logout()
    }
}

//
//  ChangePasswordInteractor.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangePasswordInteractorProtocol: class {
    func changePassword(oldPassword: String, newPassword: String, confitmPassword: String, completion: CompletionHandler)
}

final class ChangePasswordInteractor: ViperInteractor {
    weak var presenter: ChangePasswordPresenterProtocol!
    var userRepository: ICurrentUserRepository!
    var profileService: IProfileService!
}

extension ChangePasswordInteractor: ChangePasswordInteractorProtocol {
    func changePassword(oldPassword: String, newPassword: String, confitmPassword: String, completion: CompletionHandler) {
        profileService.changePassword(to: newPassword, with: oldPassword, completion: { (error) in
            completion?(error)
        })
    }
}

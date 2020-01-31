//
//  ChangeEmailInteractor.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 25.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import Firebase

protocol ChangeEmailInteractorProtocol: class {
    func getEmail() -> String?
    func changeMail(newEmail: String, password: String, completionHandler: CompletionHandler)
}

final class ChangeEmailInteractor: ViperInteractor {
    weak var presenter: ChangeEmailPresenterProtocol!
    var userRepository: ICurrentUserRepository!
    var profileService: IProfileService!
}

extension ChangeEmailInteractor: ChangeEmailInteractorProtocol {
    func getEmail() -> String? {
        return userRepository.email
    }
    
    func changeMail(newEmail: String, password: String, completionHandler: CompletionHandler) {
        profileService.changeEmail(to: newEmail, with: password, completion: {(error) in
            completionHandler?(error)
        })
    }
}

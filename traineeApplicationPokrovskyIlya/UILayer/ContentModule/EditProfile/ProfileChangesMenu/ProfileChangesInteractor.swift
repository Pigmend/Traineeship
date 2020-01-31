//
//  ProfileChangesInteractor.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 22.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol ProfileChangesInteractorProtocol: class {
    
    var avatarURL: URL? { get set }
    
    func getUsername() -> String?
    func getEmail() -> String?
    func uploadPhoto(image: UIImage, completion: UploadImageCompletion)
}

final class ProfileChangesInteractor: ViperInteractor {
    weak var presenter: ProfileChangesPresenterProtocol!
    var userRepository: ICurrentUserRepository!
    var profileService: IProfileService!
    var avatarRepository: IAvatarRepository!
}

extension ProfileChangesInteractor: ProfileChangesInteractorProtocol {
    var avatarURL: URL? {
        get {
            return userRepository.avatarUrl
        }
        set {
            userRepository.avatarUrl = newValue
        }
    }
    
    func getUsername() -> String? {
        return self.userRepository.userName
    }
    
    func getEmail() -> String? {
        return self.userRepository.email
    }
    
    func uploadPhoto(image: UIImage, completion: UploadImageCompletion) {
        avatarRepository.uploadPhoto(image: image) { (url, error) in
            completion?(url, error)
        }
    }
}

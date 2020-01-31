//
//  FirebaseUserRepository.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 19.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class FirebaseUserRepository {
    private var auth = Auth.auth()
}

extension FirebaseUserRepository: ICurrentUserRepository {
    
    var userName: String? {
        get {
            return self.auth.currentUser?.displayName
        }
        set {
            let changeRequest = self.auth.currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = newValue
            changeRequest?.commitChanges(completion: nil)
        }
    }
    
    var avatarUrl: URL? {
        get {
            return self.auth.currentUser?.photoURL
        }
        set {
            let changeRequest = self.auth.currentUser?.createProfileChangeRequest()
            changeRequest?.photoURL = newValue
            changeRequest?.commitChanges(completion: nil)
        }
    }
    
    var email: String? {
        get {
            return self.auth.currentUser?.email
        }
        set {
            guard let newEmail = newValue else { return }
            auth.currentUser?.updateEmail(to: newEmail, completion: nil)
        }
    }
}

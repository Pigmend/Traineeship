//
//  ProfileService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 05.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseStorage

class ProfileService: IProfileService {
    private var auth = Auth.auth()
    private var reference = Firestore.firestore()
    
    func changePassword(to newPassword: String, with currentPassword: String, completion: CompletionHandler) {
        guard let currentUser = auth.currentUser else { return }
        guard let oldMail = currentUser.email else { return }
        let creditionals = EmailAuthProvider.credential(withEmail: oldMail, password: currentPassword)
        currentUser.reauthenticateAndRetrieveData(with: creditionals, completion: {( _, authError) in
            if authError != nil {
                completion?(authError)
            } else {
                currentUser.updatePassword(to: newPassword, completion: { (updateError) in
                    completion?(updateError)
                })
            }
        })
    }
    
    func changeEmail(to newEmail: String, with currentPassword: String, completion: CompletionHandler) {
        guard let currentUser = auth.currentUser else { return }
        guard let oldMail = currentUser.email else { return }
        let creditionals = EmailAuthProvider.credential(withEmail: oldMail, password: currentPassword)
        currentUser.reauthenticateAndRetrieveData(with: creditionals) {( _, authError) in
            if authError != nil {
                completion?(authError)
            } else {
                currentUser.updateEmail(to: newEmail, completion: { (updateError) in
                    if updateError != nil {
                        completion?(updateError)
                    } else {
                        self.reference.collection("users").document("\(currentUser.uid)").updateData(["email": newEmail])
                        completion?(nil)
                    }
                })
            }
        }
    }
}

//
//  FirebaseAvatarService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 06.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseStorage

class FirebaseAvatarRepository: IAvatarRepository {
    private var auth = Auth.auth()
    private var reference = Firestore.firestore()
    
    func uploadPhoto(image: UIImage, completion: UploadImageCompletion) {
        guard let userID = auth.currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("userPhoto/\(userID)")
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "jpg"
        
        storageRef.putData(imageData, metadata: metaData) { ( _, uploadError) in
            if uploadError != nil {
                completion?(nil, uploadError!)
            } else {
                storageRef.downloadURL(completion: { (url, downloadError) in
                    if downloadError != nil {
                        completion?(nil, downloadError)
                    } else if let url = url {
                        self.reference.collection("users").document(userID).updateData(["imageURL": url.absoluteString])
                        completion?(url, nil)
                    } else {
                        let error = CustomError.invalidPhotoUpdate
                        completion?(nil, error)
                    }
                })
            }
        }
    }

}

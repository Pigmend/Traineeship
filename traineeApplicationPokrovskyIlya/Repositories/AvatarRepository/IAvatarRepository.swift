//
//  IAvatarService.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 06.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseStorage

protocol IAvatarRepository {
    func uploadPhoto(image: UIImage, completion: UploadImageCompletion)
}

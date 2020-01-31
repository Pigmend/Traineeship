//
//  User.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 27.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import Firebase

struct User: Codable, IUser {
    var uid: String
    var email: String
    var name: String
    var imageURL: String?
}

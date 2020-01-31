//
//  IUser.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 18.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation

protocol IUser {
    var uid: String { get set }
    var email: String { get set }
    var name: String { get set }
    var imageURL: String? { get set }
}

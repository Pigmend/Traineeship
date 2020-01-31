//
//  IUserRepository.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 19.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation

protocol ICurrentUserRepository: class {
    var userName: String? { get set }
    var avatarUrl: URL? { get set }
    var email: String? { get set }
}

//
//  IUserViewModel.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 17.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import UIKit

protocol IUserViewModel: class {
    var name: String? { get set }
    var avatarImageURL: URL? { get set }
}

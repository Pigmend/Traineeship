//
//  Helpers.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 13.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (() -> Void)?

typealias CompletionHandler = ((Error?) -> Void)?

typealias ObserveCompletion = ((User?, Error?) -> Void)?

typealias UploadImageCompletion = ((URL?, Error?) -> Void)?

typealias UploadUsersCompletion = (([User]?, Error?) -> Void)?

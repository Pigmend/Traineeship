//
//  Error.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 18.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case invalidPhotoUpdate
    case invalidUsernameUpdate
    case invalidSerialization
    case invalidPushUserToDatabase
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidPhotoUpdate:
            return NSLocalizedString("Error with Photo update", comment: "Invalid Photo update")
            
        case .invalidUsernameUpdate:
            return NSLocalizedString("Error with Username update", comment: "Invalid Username update")
            
        case .invalidSerialization:
            return NSLocalizedString("Serialization Error", comment: "Invalid Serialization")
            
        case .invalidPushUserToDatabase:
            return NSLocalizedString("Invalid add User to database", comment: "Invalid Push")
            
        }
    }
}

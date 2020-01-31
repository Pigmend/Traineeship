//
//  IUsersRepository.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 12.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation

protocol IUsersRepository: class {
    func getListOfUsers(completion: UploadUsersCompletion)
    func addUserToDatabase(user: IUser) throws
}

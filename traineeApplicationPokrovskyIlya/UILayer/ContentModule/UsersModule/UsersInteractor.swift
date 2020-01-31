//
//  UsersInteractor.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol UsersInteractorProtocol: class {
    var collectionData: [User]? { get }
    
    func getUsers(completion: CompletionHandler)
}

final class UsersInteractor: ViperInteractor {
    weak var presenter: UsersPresenterProtocol!
    var usersRepository: IUsersRepository!
    
    var users: [User]?
}

extension UsersInteractor: UsersInteractorProtocol {
    var collectionData: [User]? {
        return users
    }
    
    func getUsers(completion: CompletionHandler) {
        usersRepository.getListOfUsers { (data, error) in
            if error != nil {
                completion?(error)
            }
            if data != nil {
                self.users = data!
                completion?(nil)
            }
        }
    }
}

//
//  RealtimeDatabaseUserRepository.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 12.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import CodableFirebase

class RealtimeDatabaseUsersRepository: IUsersRepository {
    let reference = Firestore.firestore()
    
    func getListOfUsers(completion: UploadUsersCompletion) {
        reference.collection("users").getDocuments { (querrySnapshot, error) in
            if error != nil {
                completion?(nil, error)
            } else {
                var userList = [User]()
                guard let documents = querrySnapshot?.documents else {
                    let error = CustomError.invalidSerialization
                    completion?(nil, error)
                    return
                }
                for item in documents {
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.data(), options: []) else {
                        let error = CustomError.invalidSerialization
                        completion?(nil, error)
                        return
                    }
                    guard let user = try? JSONDecoder().decode(User.self, from: jsonData) else {
                        let error = CustomError.invalidSerialization
                        completion?(nil, error)
                        return
                    }
                    userList.append(user)
                }
                completion?(userList, nil)
            }
        }
    }
    
    func addUserToDatabase(user: IUser) throws {
        let newUser = User(uid: user.uid, email: user.email, name: user.name, imageURL: "")
        let data = try JSONEncoder().encode(newUser)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        if let userData = dictionary {
            reference.collection("users").document("\(user.uid)").setData(userData)
        } else {
            return
        }
    }
}

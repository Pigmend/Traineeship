//
//  UsersTableViewCell.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 16.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
}

extension UserTableViewCell: IUserViewModel {
    var name: String? {
        get {
            return usernameLabel.text
        }
        set {
            usernameLabel.text = newValue
        }
    }
    
    var avatarImageURL: URL? {
        get {
            return nil
        }
        set {
            guard let url = newValue else {
                avatarView.image = R.image.ic_placeholder()
                return
            }
            let placeholder = R.image.ic_placeholder()
            avatarView.kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
}

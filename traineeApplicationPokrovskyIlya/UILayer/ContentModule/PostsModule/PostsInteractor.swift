//
//  PostsInteractor.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol PostsInteractorProtocol: class {

}

final class PostsInteractor: ViperInteractor {
    weak var presenter: PostsPresenterProtocol!
}

extension PostsInteractor: PostsInteractorProtocol {

}

//
//  MassagesInteractor.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 20.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper

protocol MassagesInteractorProtocol: class {

}

final class MassagesInteractor: ViperInteractor {
    weak var presenter: MassagesPresenterProtocol!
}

extension MassagesInteractor: MassagesInteractorProtocol {

}

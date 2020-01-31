//
//  ProfileChangesRouter.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 22.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol ProfileChangesRouterProtocol: class {
    func showSideMenu()
    func showEmailChangeController()
    func showPasswordChangeController()
    func showPhotoChangeController()
}

final class ProfileChangesRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: ProfileChangesPresenterProtocol!
    var sideMenuRepository: ISideMenuRepository!
}

extension ProfileChangesRouter: ProfileChangesRouterProtocol {
    func showSideMenu() {
        guard let sideMenu = sideMenuRepository.getLeftSideMenu() else { return }
        
        viewController.present(sideMenu, animated: true)
    }
    
    func showEmailChangeController() {
        viewController.navigationController?.pushViewController(ChangeEmail().view, animated: true)
    }
    
    func showPasswordChangeController() {
        viewController.navigationController?.pushViewController(ChangePassword().view, animated: true)
    }
    
    func showPhotoChangeController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        guard let imagePickerDelegate = self.viewController as? (UIImagePickerControllerDelegate & UINavigationControllerDelegate) else {
            fatalError("Cant cast view controller to UIImagePickerDelegate! Check type")
        }
        
        imagePickerController.delegate = imagePickerDelegate
        viewController.present(imagePickerController, animated: true, completion: nil)
    }
    
}

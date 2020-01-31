//
//  ProfileChangesViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created Ilya Pokrovsky on 22.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation
import AppusViper
import Kingfisher

protocol ProfileChangesViewProtocol: class {
    
    var loaderView: ILoader? { get }
    var username: String? { get set }
    var email: String? { get set }
    var avatar: UIImage? { get set }
    func setAvatar(from url: URL)
    func setPlaceholder()
}

class ProfileChangesViewController: UIViewController, ViperView, IAlertHelper {
    weak var presenter: (ProfileChangesPresenterProtocol & IViewLifeCycle)!
    weak var sideMenuDelegate: ISideMenuDelegate!
    
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    var loader: ILoader!
    
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear?()
        
        initButtonsForNavigationItem()
    }
    
    // MARK: - IBActions
    @objc func sideMenuButtonPressed() {
        presenter.sideMenuAction()
    }
    
    @IBAction func changeEmailButtonPressed(_ sender: UIButton) {
        presenter.emailAction()
    }
    
    @IBAction func changePasswordButtonPressed(_ sender: UIButton) {
        presenter.passwordAction()
    }
    
    @IBAction func changePhotoButtonPressed(_ sender: UIButton) {
        presenter.photoAction()
    }
    
    // MARK: - Private
    private func initButtonsForNavigationItem() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.ic_burger(), style: .plain, target: self, action: #selector(sideMenuButtonPressed))
        
        self.navigationController?.navigationBar.backIndicatorImage = R.image.ic_back_arrow()
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = R.image.ic_back_arrow()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}

// MARK: - ProfileChangesViewController+ProfileChangesViewProtocol
extension ProfileChangesViewController: ProfileChangesViewProtocol {
    var loaderView: ILoader? {
        return self.loader
    }
    
    var username: String? {
        get {
            return usernameLabel.text
        }
        set {
            usernameLabel.text = newValue
        }
    }
    
    var email: String? {
        get {
            return emailLabel.text
        }
        set {
            emailLabel.text = newValue
        }
    }
    
    var avatar: UIImage? {
        get {
            return self.avatarImage.image
        }
        set {
            guard let photo = newValue else { return }
            self.sideMenuDelegate.updatePhoto(to: photo)
            self.avatarImage.image = photo
        }
    }
    
    func setAvatar(from url: URL) {
        let image = R.image.ic_placeholder()
        avatarImage.kf.setImage(with: url, placeholder: image)
    }
    
    func setPlaceholder() {
        avatarImage.image = R.image.ic_placeholder()
    }
}

// MARK: - ProfileChangesViewController+UIImagePickerControllerDelegate
extension ProfileChangesViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            presenter.didPickedPhoto(image: pickedImage)
            dismiss(animated: true, completion: nil)
        }
    }
    
}

// MARK: - ProfileChangesViewController+UINavigationControllerDelegate
extension ProfileChangesViewController: UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

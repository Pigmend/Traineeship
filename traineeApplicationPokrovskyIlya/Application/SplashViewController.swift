//
//  ViewController.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 11.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import FirebaseUI

class SplashViewController: UIViewController, FUIAuthDelegate {
    
    var completionHandler: Completion
    
    // MARK: - IBOutlet
    @IBOutlet weak var splashViewGif: UIImageView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSplashView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            self.completionHandler?()
        }
    }
    // MARK: - Private
    private func loadSplashView() {
        splashViewGif.loadGif(asset: "splash")
    }
    
}

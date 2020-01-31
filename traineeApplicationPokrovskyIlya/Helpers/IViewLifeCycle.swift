//
//  IViewLifeCycle.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 19.11.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation

@objc
protocol IViewLifeCycle: class {
    @objc optional
    func viewDidLoad()
    
    @objc optional
    func viewWillAppear()
    
    @objc optional
    func viewDidAppear()
    
    @objc optional
    func viewWillDisappear()
    
    @objc optional
    func viewDidDisappear()
}

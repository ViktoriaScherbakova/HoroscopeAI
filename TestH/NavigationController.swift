//
//  NavigationController.swift
//  TestH
//
//  Created by sherbakova on 15.08.2024.
//

import UIKit

final class NavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topVC = viewControllers.last {
            return topVC.preferredStatusBarStyle
        }
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        isNavigationBarHidden = false
    }
}


//
//  OnboardingAssembler.swift
//  TestH
//
//  Created by sherbakova on 25.08.2024.
//

import UIKit

struct OnboardingAssembler {
    static func build(coordinator: AppCoordinator) -> OnboardingViewControllerProtocol {
        let view = OnboardingViewController(coordinator: coordinator)
        return view
    }
}

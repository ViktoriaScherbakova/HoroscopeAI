//
//  AppCoordinator.swift
//  TestH
//
//  Created by sherbakova on 15.08.2024.
//

import UIKit

final class AppCoordinator {
    
    // Public properties
    
    var window: UIWindow? {
        guard let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
              let window = delegate.window else {
            return nil
        }
        return window
    }
    
    // Private properties
    
    private let isOnboardingShown = UserDefaultsManager.isOnboardingPassed
    private var tabBar: TabBarController?
    private var navigationController: UINavigationController?
    
    func start() {
        isOnboardingShown ? createMainModule() : showOnboarding()
    }
    
    func createMainModule() {
        guard let userZodiacType = UserDefaultsManager.userZodiacType else {
            return
        }
        let homeVC = HoroscopeAssembler.build(zodiac: userZodiacType, coordinator: self) as! HoroscopeViewController
        let listVC = ZodiacListAssembler.build(coordinator: self) as! ZodiacListViewController
        
        let firstItem = UITabBarItem(title: "Home",
                                     image: UIImage(named: "tab1"),
                                     selectedImage: UIImage(named: "tab1"))
        let secondItem = UITabBarItem(title: "Home",
                                      image: UIImage(named: "tab1"),
                                      selectedImage: UIImage(named: "tab1"))
        homeVC.tabBarItem = firstItem
        listVC.tabBarItem = secondItem
        
        let mainTabBar = TabBarController()
        
        mainTabBar.viewControllers = [
            homeVC,
            listVC
        ]
        self.tabBar = mainTabBar
        let navigationController = NavigationController(rootViewController: mainTabBar)
        // Скрыть navigationBar по умолчанию
        navigationController.navigationBar.isHidden = true
        self.navigationController = navigationController
        window?.rootViewController = navigationController
    }
    
    func showHoroscope(zodiac: ZodiacType) {
        let horoscopeViewController = HoroscopeAssembler.build(zodiac: zodiac, coordinator: self) as! HoroscopeViewController
        navigationController?.pushViewController(horoscopeViewController, animated: true)
    }
    
    func showOnboarding() {
        let onboardingViewController = OnboardingAssembler.build(coordinator: self) as! OnboardingViewController
        let navigationController = NavigationController(rootViewController: onboardingViewController )
        self.navigationController = navigationController
        window?.rootViewController = navigationController
    }
}


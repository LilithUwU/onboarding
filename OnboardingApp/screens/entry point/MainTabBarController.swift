//
//  MainTabBarController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//

import UIKit


class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let onboarding = UINavigationController(rootViewController: OnboardingViewController())
        onboarding.tabBarItem = UITabBarItem(title: "Onboarding", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))

        let profile = UINavigationController(rootViewController: ProfileViewController())
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))

        let settings = SettingsViewController()
        settings.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.fill"))

        viewControllers = [onboarding, profile, settings]

        tabBar.barTintColor = .orange
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray

        print("MainTabBarController loaded")
    }
}

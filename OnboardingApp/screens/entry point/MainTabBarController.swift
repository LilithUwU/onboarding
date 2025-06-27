//
//  MainTabBarController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//
import UIKit


// Shared UserManager Singleton
class UserManager {
    static let shared = UserManager()

    var name: String = "Default"
    var phone: String = ""
    var notificationPreference: String = ""

    private init() {}
}

class MainTabBarController: UITabBarController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupTabBarAppearance()
    }

    private func setupTabs() {
        let onboardingVC = OnboardingViewController()
        let onboardingNav = UINavigationController(rootViewController: onboardingVC)
        onboardingNav.tabBarItem = UITabBarItem(title: "Onboarding", image: UIImage(systemName: "rectangle.stack.person.crop"), tag: 0)

        let profileVC = ProfileViewController()
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)

        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)

        viewControllers = [onboardingNav, profileNav, settingsVC]
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .orange

        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]

        appearance.stackedLayoutAppearance.normal.iconColor = .gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}

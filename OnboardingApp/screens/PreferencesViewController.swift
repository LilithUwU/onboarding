//
//  PreferencesViewController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//
import UIKit

class PreferencesViewController: UIViewController {

    var userName: String = ""
     var userPhone: String = ""
    
    private let preferenceLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Preference: None"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let preferenceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select Notification Preference", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var selectedPreference: String? {
        didSet {
            if let preference = selectedPreference {
                preferenceLabel.text = "Current Preference: \(preference)"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = "Preferences"

        view.addSubview(preferenceButton)
        view.addSubview(preferenceLabel)

        setupConstraints()

        preferenceButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)

        print("PreferencesViewController loaded")
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            preferenceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            preferenceButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            preferenceButton.widthAnchor.constraint(equalToConstant: 280),
            preferenceButton.heightAnchor.constraint(equalToConstant: 50),

            preferenceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            preferenceLabel.topAnchor.constraint(equalTo: preferenceButton.bottomAnchor, constant: 20),
            preferenceLabel.widthAnchor.constraint(equalTo: preferenceButton.widthAnchor)
        ])
    }

    @objc private func showActionSheet() {
        let alert = UIAlertController(title: "Select Notification Preference", message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Email Notifications", style: .default, handler: { _ in
            self.selectedPreference = "Email Notifications"
            self.navigateToConfirm()
        }))

        alert.addAction(UIAlertAction(title: "SMS Notifications", style: .default, handler: { _ in
            self.selectedPreference = "SMS Notifications"
            self.navigateToConfirm()
        }))

        alert.addAction(UIAlertAction(title: "Push Notifications", style: .default, handler: { _ in
            self.selectedPreference = "Push Notifications"
            self.navigateToConfirm()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
    private func navigateToConfirm() {
        let confirmVC = ConfirmDetailsViewController()
        confirmVC.userName = userName
        confirmVC.userPhone = userPhone
        confirmVC.notificationPreference = selectedPreference ?? "None"
        self.navigationController?.pushViewController(confirmVC, animated: true)
    }

}



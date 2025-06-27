//
//  ConfirmDetailsViewController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//

import UIKit

class ConfirmDetailsViewController: UIViewController {

    var userName: String = ""
    var userPhone: String = ""
    var notificationPreference: String = ""

    private let summaryLabel = UILabel()
    private let startOverButton = UIButton(type: .system)
    private let editInfoButton = UIButton(type: .system)
    private let editPrefButton = UIButton(type: .system)
    private let confirmButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Confirm Details"

        navigationItem.hidesBackButton = true

        setupUI()
        layoutUI()
    }

    private func setupUI() {
        summaryLabel.numberOfLines = 0
        summaryLabel.textAlignment = .left
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.text = """
        Name: \(userName)
        Phone Number: \(userPhone)
        Notification Preference: \(notificationPreference)
        """

        [startOverButton, editInfoButton, editPrefButton, confirmButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 8
            view.addSubview($0)
        }

        startOverButton.setTitle("Start Over", for: .normal)
        startOverButton.addTarget(self, action: #selector(startOverTapped), for: .touchUpInside)

        editInfoButton.setTitle("Edit personal info", for: .normal)
        editInfoButton.addTarget(self, action: #selector(editInfoTapped), for: .touchUpInside)

        editPrefButton.setTitle("Edit preferences", for: .normal)
        editPrefButton.addTarget(self, action: #selector(editPrefTapped), for: .touchUpInside)

        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)

        view.addSubview(summaryLabel)
    }

    private func layoutUI() {
        NSLayoutConstraint.activate([
            summaryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            summaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            summaryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            startOverButton.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 30),
            startOverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startOverButton.widthAnchor.constraint(equalToConstant: 200),
            startOverButton.heightAnchor.constraint(equalToConstant: 44),

            editInfoButton.topAnchor.constraint(equalTo: startOverButton.bottomAnchor, constant: 15),
            editInfoButton.centerXAnchor.constraint(equalTo: startOverButton.centerXAnchor),
            editInfoButton.widthAnchor.constraint(equalTo: startOverButton.widthAnchor),
            editInfoButton.heightAnchor.constraint(equalToConstant: 44),

            editPrefButton.topAnchor.constraint(equalTo: editInfoButton.bottomAnchor, constant: 15),
            editPrefButton.centerXAnchor.constraint(equalTo: startOverButton.centerXAnchor),
            editPrefButton.widthAnchor.constraint(equalTo: startOverButton.widthAnchor),
            editPrefButton.heightAnchor.constraint(equalToConstant: 44),

            confirmButton.topAnchor.constraint(equalTo: editPrefButton.bottomAnchor, constant: 30),
            confirmButton.centerXAnchor.constraint(equalTo: startOverButton.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalTo: startOverButton.widthAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func startOverTapped() {
        navigationController?.popToRootViewController(animated: true)
    }

    @objc private func editInfoTapped() {
        navigationController?.popToViewController(ofType: PersonalInfoViewController.self)
    }

    @objc private func editPrefTapped() {
        navigationController?.popToViewController(ofType: PreferencesViewController.self)
    }

    @objc private func confirmTapped() {
        let alert = UIAlertController(title: "Success", message: "You have successfully completed onboarding.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            if let onboardingVC = self.navigationController?.viewControllers.first(where: { $0 is OnboardingViewController }) as? OnboardingViewController {
                onboardingVC.setRestartMode()
                self.navigationController?.popToViewController(onboardingVC, animated: true)
            }
        })
        present(alert, animated: true, completion: nil)
    }
}
extension UINavigationController {
    func popToViewController<T: UIViewController>(ofType type: T.Type) {
        if let targetVC = viewControllers.first(where: { $0 is T }) {
            popToViewController(targetVC, animated: true)
        }
    }
}


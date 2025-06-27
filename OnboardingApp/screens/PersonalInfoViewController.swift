//
//  PersonalInfoViewController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    private let nameField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your name"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let phoneField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your phone number"
        tf.keyboardType = .phonePad
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.alpha = 0.5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Personal Info"

        view.addSubview(nameField)
        view.addSubview(phoneField)
        view.addSubview(confirmButton)

        setupConstraints()
        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        nameField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        phoneField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

        print("PersonalInfoViewController loaded")
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            phoneField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            phoneField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            phoneField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),

            confirmButton.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 30),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 120),
            confirmButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func textDidChange() {
        let isNameValid = !(nameField.text ?? "").trimmingCharacters(in: .whitespaces).isEmpty
        let isPhoneValid = (phoneField.text ?? "").count >= 9
        confirmButton.isEnabled = isNameValid && isPhoneValid
        confirmButton.alpha = confirmButton.isEnabled ? 1 : 0.5
    }

    @objc private func confirmTapped() {
        let name = nameField.text ?? ""
        let phone = phoneField.text ?? ""

        let alert = UIAlertController(
            title: "Confirm Information",
            message: "Please confirm your name and phone number.\nName: \(name)\nPhone: \(phone)",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            let prefsVC = PreferencesViewController()
            self.navigationController?.pushViewController(prefsVC, animated: true)
        }))

        present(alert, animated: true, completion: nil)
    }
}

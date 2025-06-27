//
//  EditProfileViewController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//

import UIKit

class EditProfileViewController: UIViewController {

    private let nameField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter new name"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let phoneField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter new phone number"
        tf.keyboardType = .phonePad
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Edit profile"

        view.addSubview(nameField)
        view.addSubview(phoneField)
        view.addSubview(saveButton)

        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            phoneField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            phoneField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            phoneField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),

            saveButton.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        nameField.text = UserManager.shared.name
        phoneField.text = UserManager.shared.phone

        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)

        print("viewDidLoad - EditProfileViewController")
    }

    @objc private func saveTapped() {
        let newName = nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let newPhone = phoneField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        UserManager.shared.name = newName.isEmpty ? "Default" : newName
        UserManager.shared.phone = newPhone

        navigationController?.popViewController(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated); print(#function) }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated); print(#function) }
    override func viewWillLayoutSubviews() { super.viewWillLayoutSubviews(); print(#function) }
    override func viewDidLayoutSubviews() { super.viewDidLayoutSubviews(); print(#function) }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated); print(#function) }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated); print(#function) }
}

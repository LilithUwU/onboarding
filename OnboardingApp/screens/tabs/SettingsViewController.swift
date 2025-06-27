//
//  SettingsViewController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//

import UIKit

class SettingsViewController: UIViewController {

    private let toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.isOn = true
        return toggle
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Navigation is easy!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupUI()
        print(#function)
    }

    func setupUI() {
        view.addSubview(label)
        view.addSubview(toggle)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            toggle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggle.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }

    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated); print(#function) }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated); print(#function) }
    override func viewWillLayoutSubviews() { super.viewWillLayoutSubviews(); print(#function) }
    override func viewDidLayoutSubviews() { super.viewDidLayoutSubviews(); print(#function) }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated); print(#function) }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated); print(#function) }
}

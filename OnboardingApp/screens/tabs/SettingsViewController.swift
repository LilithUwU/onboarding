//
//  SettingsViewController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//

import UIKit

class SettingsViewController: UIViewController {
    private let toggle: UISwitch = {
        let sw = UISwitch()
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
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
        view.addSubview(toggle)
        view.addSubview(label)

        NSLayoutConstraint.activate([
            toggle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggle.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: toggle.bottomAnchor, constant: 20)
        ])
    }
}

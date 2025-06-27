//
//  EditProfileViewController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//

import UIKit

class EditProfileViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile Screen"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit profile"
        view.backgroundColor = .systemGray6

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        print("viewDidLoad - EditProfileViewController")
    }

    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated); print(#function) }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated); print(#function) }
    override func viewWillLayoutSubviews() { super.viewWillLayoutSubviews(); print(#function) }
    override func viewDidLayoutSubviews() { super.viewDidLayoutSubviews(); print(#function) }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated); print(#function) }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated); print(#function) }
}

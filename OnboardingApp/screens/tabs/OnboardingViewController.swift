//
//  OnboardingViewController.swift
//  OnboardingApp
//
//  Created by lilit on 15.06.25.
//
import UIKit


class OnboardingViewController: UIViewController {

    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var isRestarted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Welcome"
        view.addSubview(startButton)

        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        startButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
    }

    @objc private func startTapped() {
        let personalVC = PersonalInfoViewController()
        navigationController?.pushViewController(personalVC, animated: true)
    }

    func setRestartMode() {
        isRestarted = true
        startButton.setTitle("Restart", for: .normal)
        startButton.backgroundColor = .systemGreen
    }
}

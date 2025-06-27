import UIKit

class ProfileViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Default"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Profile"

        setupUI()
        setupNavBar()

        // Lifecycle log
        print("viewDidLoad - ProfileViewController")
    }

    private func setupUI() {
        view.addSubview(nameLabel)
        view.addSubview(editButton)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            editButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        editButton.addTarget(self, action: #selector(editProfileTapped), for: .touchUpInside)
    }

    private func setupNavBar() {
        let editItem = UIBarButtonItem(image: UIImage(systemName: "pencil.slash"), style: .plain, target: self, action: #selector(showNameAlert))
        let anonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: self, action: #selector(setAnonymousName))
        navigationItem.rightBarButtonItems = [anonItem, editItem]
    }

    @objc private func editProfileTapped() {
        let editVC = EditProfileViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }

    @objc private func showNameAlert() {
        let alert = UIAlertController(title: "Edit Name", message: "Enter a new name", preferredStyle: .alert)
        alert.addTextField()

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let name = alert.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            self.nameLabel.text = name?.isEmpty == false ? name : "Default"
        }))

        present(alert, animated: true)
    }

    @objc private func setAnonymousName() {
        nameLabel.text = "Anonymous"
    }

    // Lifecycle logging
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated); print(#function) }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated); print(#function) }
    override func viewWillLayoutSubviews() { super.viewWillLayoutSubviews(); print(#function) }
    override func viewDidLayoutSubviews() { super.viewDidLayoutSubviews(); print(#function) }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated); print(#function) }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated); print(#function) }
}

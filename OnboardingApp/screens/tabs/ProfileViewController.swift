import UIKit

class ProfileViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = "Profile"

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "pencil.slash"), style: .plain, target: self, action: #selector(editNameTapped)),
            UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: self, action: #selector(makeAnonymousTapped))
        ]

        let editButton = UIButton(type: .system)
        editButton.setTitle("Edit Profile", for: .normal)
        editButton.addTarget(self, action: #selector(editProfileTapped), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameLabel)
        view.addSubview(editButton)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),

            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = UserManager.shared.name
    }

    @objc private func editProfileTapped() {
        let editVC = EditProfileViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }

    @objc private func editNameTapped() {
        let alert = UIAlertController(title: "Edit Name", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Enter new name"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let newName = alert.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            UserManager.shared.name = newName.isEmpty ? "Default" : newName
            self.nameLabel.text = UserManager.shared.name
        }))
        present(alert, animated: true)
    }

    @objc private func makeAnonymousTapped() {
        UserManager.shared.name = "Anonymous"
        nameLabel.text = "Anonymous"
    }
}

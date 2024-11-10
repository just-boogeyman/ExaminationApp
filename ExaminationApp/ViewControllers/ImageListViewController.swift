//
//  ImageListViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 07.11.2024.
//

import UIKit

class ImageListViewController: UIViewController {
	
	var characterManager: ICharacterDataManager!
	private let cellIdentifier = "cellIdentifier"
	private let tableView = UITableView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupTableView()
		setupLayout()
	}
}


// MARK: - UITableViewDataSource
extension ImageListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		characterManager.getAllCharacters().count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		let character = characterManager.getAllCharacters()[indexPath.row]
		
		cell.accessoryType = character.isMark ? .checkmark : .none
		
		var configuration = cell.defaultContentConfiguration()
		configuration.image = UIImage(named: character.imageName)
		configuration.text = character.name
		
		cell.contentConfiguration = configuration
		
		return cell
	}
}

// MARK: - UITableViewDelegate
extension ImageListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		Constant.heightCell
	}
	
	func tableView(
		_ tableView: UITableView,
		trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
	) -> UISwipeActionsConfiguration? {
		
		let deleteActions = UIContextualAction(style: .destructive, title: "Delete") { _, _, complition in
			self.characterManager.removeCharacter(index: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
			complition(true)
		}
		
		let checkMarkAction = UIContextualAction(style: .destructive, title: "Mark") { _, _, complition in
			self.characterManager.chengeIsMark(index: indexPath.row)
			tableView.reloadRows(at: [indexPath], with: .automatic)
			complition(true)
		}
		checkMarkAction.backgroundColor = .green
		
		let configuration = UISwipeActionsConfiguration(actions: [deleteActions, checkMarkAction])
		return configuration
	}
}

// MARK: - SettingView
private extension ImageListViewController {
	func setupView() {
		view.addSubview(tableView)
		view.backgroundColor = .lightGray
	}
	
	func setupTableView() {
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
		
	}
}

// MARK: - Layout
private extension ImageListViewController {
	func setupLayout() {
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}

// MARK: - Constants
enum Constant {
	static let heightCell: CGFloat = 100
}

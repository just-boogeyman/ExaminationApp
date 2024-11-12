//
//  MarkTableViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 10.11.2024.
//

import UIKit

class MarkTableViewController: UITableViewController {
	
	var characterManager: ICharacterDataManager!
	private let cellIdeuntifier = "cellIdeuntifier"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.separatorStyle = .none
		tableView.register(CharacterCell.self, forCellReuseIdentifier: cellIdeuntifier)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		characterManager.getIsMarkCharacter().count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: cellIdeuntifier, for: indexPath
		) as? CharacterCell else { return UITableViewCell() }
		let character = characterManager.getIsMarkCharacter()[indexPath.row]
		cell.selectionStyle = .none
		cell.configure(character: character)
		cell.action = actionButton
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension MarkTableViewController {
	func actionButton(cell: UITableViewCell) {
		if let indexPath = tableView.indexPath(for: cell) {
			let character = characterManager.getIsMarkCharacter()[indexPath.row]
			characterManager.toggleMark(character)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
}

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
		view.backgroundColor = .lightGray
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
		
		cell.configure(character: character)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

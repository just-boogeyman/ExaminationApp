//
//  CharactersManager.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

class CharactersManager {
	
	func getCharacters() -> [Character] {
		 [
			Character(
				imageName: "Character 1",
				number: 1,
				name: "Rick Sanchez",
				status: .alive,
				species: "Human"
			),
			Character(
				imageName: "Character 2",
				number: 2,
				name: "Corn detective",
				status: .dead,
				species: "Humanoid"
			),
			Character(
				imageName: "Character 3",
				number: 3,
				name: "Amish Cyborg",
				status: .dead,
				species: "Alien"
			),
			Character(
				imageName: "Character 4",
				number: 4,
				name: "Snake Reporter",
				status: .dead,
				species: "Animal"
			),
			Character(
				imageName: "Character 5",
				number: 5,
				name: "Phone-person",
				status: .alive,
				species: "Humanoid"
			),
			Character(
				imageName: "Character 6",
				number: 6,
				name: "Alien Rick",
				status: .none,
				species: "Alien"
			),
			Character(
				imageName: "Character 7",
				number: 7,
				name: "Crystal Poacher",
				status: .dead,
				species: "Alien"
			)
		]
	}
}

//
//  CharactersManager.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

protocol ICharactersManager {
	func getCharacters() -> [Character]
}

class CharactersManager {}

extension CharactersManager: ICharactersManager {
	func getCharacters() -> [Character] {
		 [
			Character(
				imageName: "1",
				number: 1,
				name: "Rick Sanchez",
				status: .alive,
				species: "Human",
				isMark: false
			),
			Character(
				imageName: "2",
				number: 2,
				name: "Corn detective",
				status: .dead,
				species: "Humanoid",
				isMark: true
			),
			Character(
				imageName: "3",
				number: 3,
				name: "Amish Cyborg",
				status: .dead,
				species: "Alien",
				isMark: false
			),
			Character(
				imageName: "4",
				number: 4,
				name: "Snake Reporter",
				status: .dead,
				species: "Animal",
				isMark: true
			),
			Character(
				imageName: "5",
				number: 5,
				name: "Phone-person",
				status: .alive,
				species: "Humanoid",
				isMark: false
			),
			Character(
				imageName: "6",
				number: 6,
				name: "Alien Rick",
				status: .unknown,
				species: "Alien",
				isMark: true
			),
			Character(
				imageName: "7",
				number: 7,
				name: "Crystal Poacher",
				status: .dead,
				species: "Alien",
				isMark: false
			)
		]
	}
}

//
//  CharactersManager.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

class CharactersManager {
	
	func getCharacters() -> [Characters] {
		return [
			Characters(
				imageName: "Character 1",
				number: 1,
				name: "Rick Sanchez",
				status: "Alive",
				species: "Human"
			),
			Characters(
				imageName: "Character 2",
				number: 2,
				name: "Corn detective",
				status: "Dead",
				species: "Humanoid"
			),
			Characters(
				imageName: "Character 3",
				number: 3,
				name: "Amish Cyborg",
				status: "Dead",
				species: "Alien"
			)
		]
	}
}

//
//  CharactersDataManager.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

class CharacterDataManager {
	
	private var characters: [Characters] = []
	private var currentIndex = 0
	
	init(characters: [Characters]) {
		self.characters = characters
	}
	
	func getCharacters() -> Characters {
		characters[currentIndex]
	}
	
	func getNextCharacter() -> Characters {
		if currentIndex < characters.count - 1 {
			currentIndex += 1
		}
		return getCharacters()
	}
}

//
//  CharactersDataManager.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

protocol ICharacterDataManager {
	func getCharacter() -> Character
	func getNextCharacter() -> Character
	func getLastCharacter() -> Character
	func getFirstCharacter() -> Character
	func getSearchCharacter(image: String) -> Character?
}

class CharacterDataManager {
	
	private var characters: [Character] = []
	private var currentIndex = 0
	
	init(characters: [Character]) {
		self.characters = characters
	}
}

// MARK: - ICharacterDataManager
extension CharacterDataManager: ICharacterDataManager {
	func getCharacter() -> Character {
		characters[currentIndex]
	}
	
	func getSearchCharacter(image: String) -> Character? {
		for character in characters {
			if character.imageName == image {
				return character
			}
		}
		return nil
	}
	
	func getNextCharacter() -> Character {
		if currentIndex < characters.count - 1 {
			currentIndex += 1
		}
		return getCharacter()
	}
	
	func getLastCharacter() -> Character {
		if currentIndex > 0 {
			currentIndex -= 1
		}
		return getCharacter()
	}
	
	func getFirstCharacter() -> Character {
		currentIndex = 0
		return getCharacter()
	}
}

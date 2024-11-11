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
	func getRandomCharacter() -> Character?
	func getAllCharacters() -> [Character]
	func removeCharacter(index: Int)
	func chengeIsMark(index: Int)
	func getIsMarkCharacter() -> [Character]
	func toggleMark(_ character: Character)
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
	func toggleMark(_ character: Character) {
		if let index = characters.firstIndex(of: character) {
			characters[index].isMark.toggle()
		}
	}
	
	func getIsMarkCharacter() -> [Character] {
		var isMarkCharacters = [Character]()
		characters.forEach{
			if $0.isMark {isMarkCharacters.append($0)}
		}
		return isMarkCharacters
	}
	
	func chengeIsMark(index: Int) {
		characters[index].isMark.toggle()
	}
	
	func removeCharacter(index: Int) {
		characters.remove(at: index)
	}
	
	func getAllCharacters() -> [Character] {
		characters
	}
	
	func getRandomCharacter() -> Character? {
		characters.randomElement()
	}
	
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

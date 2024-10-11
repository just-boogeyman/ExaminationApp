//
//  RichAndMortyModel.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import Foundation

enum CharacterStatus {
	case alive
	case dead
	case unknown
}

struct Character {
	
	let imageName: String
	let number: Int
	let name: String
	let status: CharacterStatus
	let species: String
}

// MARK: - CustomStringConvertible
extension Character: CustomStringConvertible {
	var description: String {
		"Название картинки: \(imageName), описание: \(name)"
	}
}

// MARK: - Comparable
extension Character: Comparable {
	static func < (lhs: Character, rhs: Character) -> Bool {
		lhs.imageName < rhs.imageName
	}
}

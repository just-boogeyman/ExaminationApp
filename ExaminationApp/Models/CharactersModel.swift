//
//  RichAndMortyModel.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import Foundation

struct Character {
	
	let imageName: String
	let number: Int
	let name: String
	let status: CharacterStatus
	let species: String
}

enum CharacterStatus {
	case alive
	case dead
	case unknown
}

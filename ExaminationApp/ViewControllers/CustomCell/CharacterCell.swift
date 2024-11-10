//
//  CharacterCell.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 10.11.2024.
//

import UIKit

class CharacterCell: UITableViewCell {
	
	private let nameLable = UILabel()
	private let speciesLable = UILabel()
	
	private let imageCharacter = CastomImageView(imageName: "1")
	private let markButton = UIButton()
		
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}
	
	@available (*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(character: Character) {
		imageCharacter.image = UIImage(named: character.imageName)
		nameLable.text = character.name
		speciesLable.text = character.species
		markButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
	}
}

// MARK: - Setup View
private extension CharacterCell {
	func setup() {
		[nameLable,
		 imageCharacter, speciesLable,
		 markButton].forEach{contentView.addSubview($0)}
		setupImage()
		setupDescription()
		setupNameLabel()
		setupLayout()
	}
	
	func setupNameLabel() {
		nameLable.font = .boldSystemFont(ofSize: 20)
	}

	func setupDescription() {
		speciesLable.numberOfLines = 0
	}
	
	func setupImage() {
		imageCharacter.widthAnchor.constraint(equalToConstant: 100).isActive = true
		imageCharacter.heightAnchor.constraint(equalToConstant: 100).isActive = true
		imageCharacter.contentMode = .scaleAspectFill
	}
}

// MARK: - Layout
private extension CharacterCell {
	func setupLayout() {
		[nameLable, speciesLable, imageCharacter, markButton]
			.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
		
		NSLayoutConstraint.activate([
			imageCharacter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			imageCharacter.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
			imageCharacter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

			
			nameLable.leadingAnchor.constraint(equalTo: imageCharacter.trailingAnchor, constant: 16),
			nameLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
			nameLable.trailingAnchor.constraint(equalTo: markButton.leadingAnchor, constant: -8),
			
			speciesLable.leadingAnchor.constraint(equalTo: imageCharacter.trailingAnchor, constant: 16),
			speciesLable.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 4),
			speciesLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
			
			markButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			markButton.centerYAnchor.constraint(equalTo: nameLable.centerYAnchor),
			markButton.widthAnchor.constraint(equalToConstant: 36),
			markButton.heightAnchor.constraint(equalToConstant: 36)
		])
	}
}

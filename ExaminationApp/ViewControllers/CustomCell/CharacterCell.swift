//
//  CharacterCell.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 10.11.2024.
//

import UIKit

class CharacterCell: UITableViewCell {
	
	// MARK: - Private View
	private let nameLable = UILabel()
	private let statusLable = UILabel()
	
	private let imageCharacter = CastomImageView(imageName: "1")
	
	private let containerView = ShadowView(color: .lightGray, shadow: true)
	private let viewLife = UIView()
	private let markButton = UIButton()
	private var toggleMark = false
	
	var action: ((UITableViewCell) -> ())?
		
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
		statusLable.text = "\(character.status) - \(character.species)"
		toggleMark = character.isMark
		
		let mark = toggleMark ? "checkmark.square.fill" : "checkmark.square"
		markButton.setImage(UIImage(systemName: mark), for: .normal)
		
		switch character.status {
		case .alive:
			settingColor(.green)
		case .dead:
			settingColor(.red)
		case .unknown:
			settingColor(.systemCyan)
		}
	}
	
	@objc
	func toggleMarkButton() {
		toggleMark.toggle()
		let mark = toggleMark ? "checkmark.square.fill" : "checkmark.square"
		markButton.setImage(UIImage(systemName: mark), for: .normal)
		action?(self)
	}
}

// MARK: - Private Metods
private extension CharacterCell {
	func settingColor(_ color: UIColor) {
		imageCharacter.layer.borderColor = color.cgColor
		viewLife.backgroundColor = color
	}
	
	func setupButton() {
		markButton.addTarget(self, action: #selector(toggleMarkButton), for: .touchUpInside)
	}
}

// MARK: - Setup View
private extension CharacterCell {
	func setup() {
		contentView.addSubview(containerView)
		[nameLable, statusLable,
		 imageCharacter,
		 markButton, viewLife].forEach{containerView.addSubview($0)}
		setupImage()
		setupNameLabel()
		setupButton()
		setupLayout()
	}
	
	func setupNameLabel() {
		nameLable.font = .boldSystemFont(ofSize: 20)
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
		[containerView, viewLife,nameLable, imageCharacter, markButton, statusLable]
			.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
		
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
			containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
			containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
			containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

			imageCharacter.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
			imageCharacter.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
			imageCharacter.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
			
			nameLable.leadingAnchor.constraint(equalTo: imageCharacter.trailingAnchor, constant: 16),
			nameLable.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
			nameLable.trailingAnchor.constraint(equalTo: markButton.leadingAnchor, constant: -8),
			
			viewLife.centerYAnchor.constraint(equalTo: imageCharacter.centerYAnchor),
			viewLife.leadingAnchor.constraint(equalTo: imageCharacter.trailingAnchor),
			viewLife.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			viewLife.heightAnchor.constraint(equalToConstant: 3),
			
			statusLable.leadingAnchor.constraint(equalTo: imageCharacter.trailingAnchor, constant: 16),
			statusLable.topAnchor.constraint(equalTo: viewLife.bottomAnchor, constant: 8),
			statusLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16),
			
			markButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
			markButton.centerYAnchor.constraint(equalTo: nameLable.centerYAnchor),
			markButton.widthAnchor.constraint(equalToConstant: 36),
			markButton.heightAnchor.constraint(equalToConstant: 36)
		])
	}
}

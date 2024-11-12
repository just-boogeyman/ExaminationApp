//
//  CharacterCell.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 10.11.2024.
//

import UIKit

class CharacterCell: UITableViewCell {

	private let containerView = CustomContainerView(shadow: true)

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
		containerView.configure(character: character)
		containerView.action = toggleMarkButton
	}
	
	private func toggleMarkButton() {
		action?(self)
	}
}

extension CharacterCell {
	private func setup() {
		contentView.addSubview(containerView)
		setupLayout()
	}
}


// MARK: - Layout
private extension CharacterCell {
	func setupLayout() {
		containerView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
			containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
			containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
			containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
		])
	}
}

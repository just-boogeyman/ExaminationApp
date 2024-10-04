//
//  ShadowBottun.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 04.10.2024.
//

import UIKit


class ShadowButton: UIButton {
	
	init(text: String, color: UIColor, shadow: Bool = false) {
		super.init(frame: .zero)
		setupButton(
			text: text,
			color: color,
			shadow: shadow
		)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


// MARK: - SetupButton
extension ShadowButton {
	func setupButton(text: String, color: UIColor, shadow: Bool) {
		setTitle(
			text,
			for: .normal
		)
		layer.cornerRadius = 20
		backgroundColor = color
		heightAnchor.constraint(equalToConstant: 50).isActive = true
	}
}

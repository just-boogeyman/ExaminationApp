//
//  ShadowBottun.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 04.10.2024.
//

import UIKit

@objc protocol ICustomButtonDelegate {
	func pressedButton(_ button: UIButton)
}

class ShadowButton: UIButton {
	
	var nameInstance: String?
	var delegate: ICustomButtonDelegate?
	
	init(text: String, color: UIColor, shadow: Bool = false) {
		super.init(frame: .zero)
		setupButton(
			text: text,
			color: color,
			shadow: shadow
		)
		addAction()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		let shadowPath = UIBezierPath(rect: bounds)
		layer.shadowPath = shadowPath.cgPath
	}
}


// MARK: - SetupButton
private extension ShadowButton {
	func setupButton(text: String, color: UIColor, shadow: Bool) {
		setTitle(
			text,
			for: .normal
		)
		layer.cornerRadius = 10
		backgroundColor = color
		heightAnchor.constraint(equalToConstant: 30).isActive = true
		widthAnchor.constraint(equalToConstant: 120).isActive = true
		
		if shadow {
			layer.shadowColor = UIColor.black.cgColor
			layer.shadowRadius = 7
			layer.shadowOpacity = 0.7
		}
	}
	
	func addAction() {
		let action = UIAction { _ in
			self.delegate?.pressedButton(self)
		}
		addAction(action, for: .touchUpInside)
	}
}

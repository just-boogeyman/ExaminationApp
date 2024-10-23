//
//  CastomTextField.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 23.10.2024.
//

import UIKit


class CustomTextField: UITextField {
	
	init() {
		super.init(frame: .zero)
		setupView()
	}
	
	@available (*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension CustomTextField {
	func setupView() {
		placeholder = "Название картинки"
		textAlignment = .left
		borderStyle = .roundedRect
		heightAnchor.constraint(equalToConstant: 50).isActive = true
	}
}

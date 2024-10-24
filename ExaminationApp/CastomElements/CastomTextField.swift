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
	
	override func layoutSubviews() {
		super.layoutSubviews()
		let shadowPath = UIBezierPath(rect: bounds)
		layer.shadowPath = shadowPath.cgPath
	}
}

private extension CustomTextField {
	func setupView() {
		placeholder =  "Введите название картинки"
		textAlignment = .left
		borderStyle = .roundedRect
		layer.shadowRadius = Constants.shadowRadius
		layer.shadowOpacity = Constants.shadowOpacity
		heightAnchor.constraint(equalToConstant: 40).isActive = true
	}
}


// MARK: - Constants
private extension CustomTextField {
	enum Constants {
		static let shadowRadius: CGFloat = 20
		static let shadowOpacity: Float = 0.5
		static let shadowOffset = CGSize(width: 5.0, height: 5.0)
	}
}

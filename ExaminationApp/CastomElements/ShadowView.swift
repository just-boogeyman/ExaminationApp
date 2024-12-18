//
//  ShadowView.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 05.10.2024.
//

import UIKit

class ShadowView: UIView {
	
	var nameInstance: String?
	
	init(color: UIColor, cornerRadius: CGFloat = 20 ,shadow: Bool = false) {
		super.init(frame: .zero)
		setupView(color: color, cornerRadius: cornerRadius,shadow: shadow)
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

// MARK: - SetupView
extension ShadowView {
	private func setupView(color: UIColor, cornerRadius: CGFloat, shadow: Bool) {
		backgroundColor = color
		layer.cornerRadius = cornerRadius
		if shadow {
			layer.shadowColor = UIColor.darkGray.cgColor
			layer.shadowRadius = 10
			layer.shadowOpacity = Constants.shadowOpacity
			layer.shadowOffset = Constants.shadowOffset
		}
	}
}

// MARK: - Constants
private extension ShadowView {
	enum Constants {
		static let shadowOpacity: Float = 3
		static let shadowOffset = CGSize(width: 5.0, height: 5.0)
	}
}

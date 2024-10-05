//
//  CastomLable.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 05.10.2024.
//

import UIKit

class CastomLable: UILabel {
	
	init(font: String, size: CGFloat) {
		super.init(frame: .zero)
		setupLable(fontName: font, size: size)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

// MARK: - SetupLable
extension CastomLable {
	private func setupLable(fontName: String, size: CGFloat) {
		font = UIFont(name: fontName, size: size)
		textColor = .white
	}
}
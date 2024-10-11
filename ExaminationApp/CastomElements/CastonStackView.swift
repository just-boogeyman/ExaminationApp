//
//  CastonStackView.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 08.10.2024.
//

import UIKit

class CastomStackView: UIStackView {
	
	init() {
		super.init(frame: .zero)
		setupStack()
	}
	
	@available(*, unavailable)
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


private extension CastomStackView {
	func setupStack() {
		axis = .horizontal
		alignment = .fill
		distribution = .equalSpacing
	}
}

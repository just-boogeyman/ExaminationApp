//
//  castomImage.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 05.10.2024.
//

import UIKit

class CastomImageView: UIImageView {

	init(imageName: String) {
		super.init(frame: .zero)
		setupImageView(imageName: imageName)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	@available (*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension CastomImageView {
	private func setupImageView(imageName: String) {
		image = UIImage(named: imageName)
		layer.cornerRadius = 20
		clipsToBounds = true
		layer.borderWidth = 3
		layer.borderColor = UIColor.green.cgColor
	}
}

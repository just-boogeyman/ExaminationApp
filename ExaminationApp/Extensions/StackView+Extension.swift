//
//  StackView+Extension.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 08.10.2024.
//

import UIKit

extension UIStackView {
	
	func addArrangedSubviews(_ views: UIView...) {
		views.forEach{addArrangedSubview($0)}
	}
}

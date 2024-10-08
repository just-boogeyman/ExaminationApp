//
//  View+Extension.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 08.10.2024.
//

import UIKit

extension UIView {
	func addSubviews(_ views: UIView...) {
		views.forEach{addSubview($0)}
	}
}

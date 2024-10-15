//
//  View+Extension.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 08.10.2024.
//

import UIKit

//MARK: - addSubviews

extension UIView {
	func addSubviews(_ views: UIView...) {
		views.forEach{addSubview($0)}
	}
}

extension UIView {
	func getCountUIButtons(_ views: UIView...) -> Int {
		var count = 0
		views.forEach{
			if $0 is UIButton { count += 1 }
		}
		return count
	}
	
	func printAllSubviews(_ views: UIView...) {
		views.forEach{
			guard let shadowButton = $0 as? ShadowButton else { return }
			print(shadowButton.nameInstance ?? "ShadowButton?")
		}
	}
}

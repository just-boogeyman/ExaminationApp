//
//  ViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let stackView = UIStackView()
	private let lastButton = ShadowButton(text: "Last", color: .cyan)
	private let nextButton = ShadowButton(text: "Next", color: .green)
	private let firstButton = ShadowButton(text: "First", color: .red)

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupStackView()
		setupLayoutStackview()
	}
	
	
}

// MARK: - SetupView
private extension ViewController {
	func setupView() {
		view.backgroundColor = .white
		view.addSubview(stackView)
	}
	
	func setupStackView() {
		stackView.axis = .vertical
		stackView.spacing = 20
		stackView.alignment = .fill
		stackView.distribution = .equalSpacing
		
		[lastButton, nextButton, firstButton]
			.forEach{stackView.addArrangedSubview($0)}
	}
}

extension ViewController {
	private func setupLayoutStackview() {
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
		])
	}
}

//
//  ViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let stackView = UIStackView()
	private let imageView = UIImageView()
	private let imageContainerView = UIView()
	private let lastButton = ShadowButton(text: "Last", color: .cyan)
	private let nextButton = ShadowButton(text: "Next", color: .green)
	private let firstButton = ShadowButton(text: "First", color: .red)
	
	private let characterDataManager = CharacterDataManager(
		characters: CharactersManager().getCharacters()
	)

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		getImage()
		setupContainerView()
		setupImageView()
		setupStackView()
		addActionNext()
		addActionLast()
		addAcrionFirst()
		setupLayoutStackview()
	}
	
	private func getImage() {
		print("\(characterDataManager.getCharacter())")
	}
	
	
}

// MARK: - SetupView
private extension ViewController {
	func addActionNext() {
		let action = UIAction { _ in
			let character = self.characterDataManager.getNextCharacter()
			self.imageView.image = UIImage(named: character.imageName)
		}
		nextButton.addAction(action, for: .touchUpInside)
	}
	
	func addActionLast() {
		let action = UIAction { _ in
			let character = self.characterDataManager.getLastCharacter()
			self.imageView.image = UIImage(named: character.imageName)
		}
		lastButton.addAction(action, for: .touchUpInside)
	}
	
	func addAcrionFirst() {
		let action = UIAction { _ in
			let character = self.characterDataManager.getFirstCharacter()
			self.imageView.image = UIImage(named: character.imageName)
		}
		firstButton.addAction(action, for: .touchUpInside)
	}
	
	func setupView() {
		view.backgroundColor = .gray
		view.addSubview(stackView)
	}
	
	func setupContainerView() {
		imageContainerView.layer.cornerRadius = 20
		view.addSubview(imageContainerView)
	}
	
	func setupImageView() {
		imageView.image = UIImage(named: "Character 1")
		imageView.layer.cornerRadius = 20
		imageView.clipsToBounds = true
		imageContainerView.addSubview(imageView)
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


// MARK: - SetupLoyaut
extension ViewController {
	private func setupLayoutStackview() {
		stackView.translatesAutoresizingMaskIntoConstraints = false
		imageContainerView.translatesAutoresizingMaskIntoConstraints = false
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			imageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
			imageContainerView.heightAnchor.constraint(equalToConstant: view.frame.width / 2),
			
			imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
			imageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor),
			imageView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor),
			
			stackView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 100),
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
		])
	}
}

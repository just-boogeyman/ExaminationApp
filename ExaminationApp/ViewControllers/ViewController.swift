//
//  ViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let stackView = UIStackView()
	
	private let imageView = CastomImageView(imageName: "Character 1")
	private let imageContainerView = ShadowView(color: .white)
	
	private let lableContainerView = ShadowView(color: .darkGray, shadow: true)
	private let lineStatusView = UIView()
	private let statusView = ShadowView(color: .green, cornerRadius: 10,shadow: true)
	
	private let nameLable = CastomLable(font: "Arial Rounded MT Bold", size: 20)
	private let statusLable = CastomLable(font: "Arial Rounded MT Bold", size: 18)
	
	private let lastButton = ShadowButton(text: "Last", color: .cyan, shadow: true)
	private let nextButton = ShadowButton(text: "Next", color: .green, shadow: true)
	private let firstButton = ShadowButton(text: "First", color: .red)
	
	private let characterDataManager = CharacterDataManager(
		characters: CharactersManager().getCharacters()
	)

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupLineView()
		setupLable()
		setupStackView()
	
		settingStatus(
			character: characterDataManager.getCharacter()
		)
		
		addActionNext()
		addActionLast()
		addAcrionFirst()
		
		setupLoyaut()
	}
	
	private func setupLoyaut() {
		setupLayoutImageView()
		setupLayoutInfoContainer()
		setupLayoutStackView()
		setupLayoutfirstButton()
	}
	
	private func settingStatus(character: Character) {
		imageView.image = UIImage(
			named: character.imageName
		)
		nameLable.text = character.name
		statusLable.text = "\(character.status) - \(character.species)"
		
		switch character.status {
		case "Alive":
			imageView.layer.borderColor = UIColor.green.cgColor
			lineStatusView.backgroundColor = .green
			statusView.backgroundColor = .green
			lableContainerView.layer.shadowColor = UIColor.green.cgColor
		case "Dead":
			imageView.layer.borderColor = UIColor.red.cgColor
			lineStatusView.backgroundColor = .red
			statusView.backgroundColor = .red
			lableContainerView.layer.shadowColor = UIColor.red.cgColor
		default:
			imageView.layer.borderColor = UIColor.white.cgColor
			lineStatusView.backgroundColor = .white
			statusView.backgroundColor = .white
			lableContainerView.layer.shadowColor = UIColor.white.cgColor
		}
	}
}

// MARK: - SetupView
private extension ViewController {
	func addActionNext() {
		let action = UIAction { _ in
			self.settingStatus(
				character: self.characterDataManager.getNextCharacter()
			)
		}
		nextButton.addAction(action, for: .touchUpInside)
	}
	
	func addActionLast() {
		let action = UIAction { _ in
			self.settingStatus(
				character: self.characterDataManager.getLastCharacter()
			)
		}
		lastButton.addAction(action, for: .touchUpInside)
	}
	
	func addAcrionFirst() {
		let action = UIAction { _ in
			self.settingStatus(
				character: self.characterDataManager.getFirstCharacter()
			)
		}
		firstButton.addAction(action, for: .touchUpInside)
	}
	
	func setupView() {
		view.backgroundColor = .lightGray
		
		[imageContainerView, lineStatusView, lableContainerView, stackView, firstButton]
			.forEach{view.addSubview($0)}
		
		imageContainerView.addSubview(imageView)
		lableContainerView.addSubview(statusView)
	}
	
	func setupLineView() {
		lineStatusView.backgroundColor = .green
	}
	
	func setupLable() {
		[nameLable, statusLable]
			.forEach{lableContainerView.addSubview($0)}
	}
	
	func setupStackView() {
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .equalSpacing
		
		[lastButton, nextButton]
			.forEach{stackView.addArrangedSubview($0)}
	}
}


// MARK: - SetupLoyaut
private extension ViewController {
	func setupLayoutImageView() {
		[imageContainerView,
		 imageView,
		 lineStatusView].forEach{
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
		
		NSLayoutConstraint.activate([
			imageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
			imageContainerView.heightAnchor.constraint(equalToConstant: view.frame.width / 2),
			
			imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
			imageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor),
			imageView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor),
			
			lineStatusView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
			lineStatusView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			lineStatusView.widthAnchor.constraint(equalToConstant: 3),
			lineStatusView.heightAnchor.constraint(equalToConstant: 70)
		])
	}
	
	func setupLayoutInfoContainer() {
		[lableContainerView,
		 nameLable,
		 statusLable,
		 statusView].forEach{
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
		
		NSLayoutConstraint.activate([
			lableContainerView.topAnchor.constraint(equalTo: lineStatusView.bottomAnchor),
			lableContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			lableContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
			lableContainerView.heightAnchor.constraint(equalToConstant: 100),
			
			nameLable.topAnchor.constraint(equalTo: lableContainerView.topAnchor, constant: 15),
			nameLable.centerXAnchor.constraint(equalTo: lableContainerView.centerXAnchor),
			
			statusView.topAnchor.constraint(equalTo: nameLable.topAnchor, constant: 30),
			statusView.leadingAnchor.constraint(equalTo: lableContainerView.leadingAnchor, constant: 40),
			statusView.widthAnchor.constraint(equalToConstant: 20),
			statusView.heightAnchor.constraint(equalToConstant: 20),
			
			statusLable.topAnchor.constraint(equalTo: nameLable.topAnchor, constant: 30),
			statusLable.leadingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: 20)
		])
	}
	
	func setupLayoutStackView() {
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: lableContainerView.bottomAnchor, constant: 50),
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
		])
	}
	
	func setupLayoutfirstButton() {
		firstButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			firstButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 80),
			firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}

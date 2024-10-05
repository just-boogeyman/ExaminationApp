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
	
	private let lableContainerView = UIView()
	private let lineStatusView = UIView()
	private let statusView = UIView()
	
	private let nameLable = UILabel()
	private let statusLable = UILabel()
	
	private let lastButton = ShadowButton(text: "Last", color: .cyan)
	private let nextButton = ShadowButton(text: "Next", color: .green)
	private let firstButton = ShadowButton(text: "First", color: .red)
	
	private let characterDataManager = CharacterDataManager(
		characters: CharactersManager().getCharacters()
	)

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		
		setupContainerView()
		setupImageView()
		
		setupLineView()
		
		setupLableContainerView()
		setupStatusView()
		setupLable()
		
		setupStackView()
		
		addActionNext()
		addActionLast()
		addAcrionFirst()
		
		setupLayoutStackview()
	}
	
	private func settingStatus(character: Character) {
		imageView.image = UIImage(named: character.imageName)
		nameLable.text = character.name
		statusLable.text = "\(character.status) - \(character.species)"
		switch character.status {
		case "Alive":
			imageView.layer.borderColor = UIColor.green.cgColor
			lineStatusView.backgroundColor = .green
			statusView.backgroundColor = .green
		case "Dead":
			imageView.layer.borderColor = UIColor.red.cgColor
			lineStatusView.backgroundColor = .red
			statusView.backgroundColor = .red
		default:
			imageView.layer.borderColor = UIColor.white.cgColor
			lineStatusView.backgroundColor = .white
			statusView.backgroundColor = .white
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
		
		view.addSubview(imageContainerView)
		view.addSubview(lineStatusView)
		view.addSubview(lableContainerView)
		view.addSubview(stackView)
	}
	
	func setupContainerView() {
		imageContainerView.layer.cornerRadius = 20
	}
	
	func setupImageView() {
		imageView.image = UIImage(named: "Character 1")
		imageView.layer.cornerRadius = 20
		imageView.clipsToBounds = true
		imageView.layer.borderWidth = 3
		imageView.layer.borderColor = UIColor.green.cgColor
		imageContainerView.addSubview(imageView)
	}
	
	func setupLineView() {
		lineStatusView.backgroundColor = .green
	}
	
	func setupLableContainerView() {
		lableContainerView.backgroundColor = .darkGray
		lableContainerView.layer.cornerRadius = 20
	}
	
	func setupStatusView() {
		statusView.backgroundColor = .green
		statusView.layer.cornerRadius = 10
		lableContainerView.addSubview(statusView)
	}
	
	func setupLable() {
		let character = characterDataManager.getCharacter()
		nameLable.text = character.name
		statusLable.text = "\(character.status) - \(character.species)"
		lableContainerView.addSubview(nameLable)
		lableContainerView.addSubview(statusLable)

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
		[stackView,
		 imageContainerView,
		 imageView,
		 lableContainerView,
		 nameLable,
		 statusLable,
		 lineStatusView,
		 statusView].forEach{
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
			lineStatusView.heightAnchor.constraint(equalToConstant: 70),
						
			lableContainerView.topAnchor.constraint(equalTo: lineStatusView.bottomAnchor),
			lableContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			lableContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
			lableContainerView.heightAnchor.constraint(equalToConstant: 100),
			
			nameLable.topAnchor.constraint(equalTo: lableContainerView.topAnchor, constant: 15),
			nameLable.centerXAnchor.constraint(equalTo: lableContainerView.centerXAnchor),
			
			statusView.topAnchor.constraint(equalTo: nameLable.topAnchor, constant: 20),
			statusView.leadingAnchor.constraint(equalTo: lableContainerView.leadingAnchor, constant: 20),
			statusView.widthAnchor.constraint(equalToConstant: 20),
			statusView.heightAnchor.constraint(equalToConstant: 20),
			
			statusLable.topAnchor.constraint(equalTo: nameLable.topAnchor, constant: 20),
			statusLable.leadingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: 20),
			
			stackView.topAnchor.constraint(equalTo: lableContainerView.bottomAnchor, constant: 50),
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
		])
	}
}

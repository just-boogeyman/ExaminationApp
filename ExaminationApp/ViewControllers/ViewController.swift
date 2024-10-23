//
//  ViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let stackView = CastomStackView()
	
	private let imageView = CastomImageView(
		imageName: Constants.imageName
	)
	private let imageContainerView = ShadowView(
		color: .white
	)
	
	private let lableContainerView = ShadowView(
		color: .darkGray,
		shadow: true
	)
	private let lineStatusView = UIView()
	private let statusView = ShadowView(
		color: .green,
		cornerRadius: 10,
		shadow: true
	)
	
	private let nameLable = CastomLable(
		font: Constants.fontLable,
		size: Constants.sizeNameLable
	)
	private let statusLable = CastomLable(
		font: Constants.fontLable,
		size: Constants.sizeStatusLable
	)
	
	private let infoImageLable = CastomLable(
		font: Constants.fontLable,
		size: Constants.sizeStatusLable
	)
	
	private let lastButton = ShadowButton(
		text: "Last",
		color: .cyan,
		shadow: true
	)
	private let nextButton = ShadowButton(
		text: "Next", color: .green,
		shadow: true
	)
	private let firstButton = ShadowButton(
		text: "First",
		color: .red
	)
	
	var characterDataManager: ICharacterDataManager?

	override func viewDidLoad() {
		super.viewDidLoad()
		addDelegate()
		setupView()
		addSubviews()
		settingStatus(
			character: characterDataManager?.getCharacter()
		)
		setupLoyaut()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		
		guard let touch = touches.first else { return }
		let touchLocation = touch.location(in: imageView)
		
		if imageView.bounds.contains(touchLocation) {
			infoImageLable.isHidden = false
			let nameImage = characterDataManager?.getCharacter().imageName
			infoImageLable.text = nameImage
		}
	}
}

// MARK: - Private Methods
private extension ViewController {
	func setupLoyaut() {
		setupLayoutImageView()
		setupLayoutInfoContainer()
		setupLayoutStackView()
		setupLayoutfirstButton()
	}
	
	func settingStatus(character: Character?) {
		if !infoImageLable.isHidden {
			infoImageLable.isHidden = true
		}
		guard let character = character else { return }
		imageView.image = UIImage(
			named: character.imageName
		)
		nameLable.text = character.name
		statusLable.text = "\(character.status) - \(character.species)"
		
		switch character.status {
		case .alive:
			setupStatusStyle(color: .green)
		case .dead:
			setupStatusStyle(color: .red)
		default:
			setupStatusStyle(color: .white)
		}
	}
	
	func setupStatusStyle(color: UIColor) {
		imageView.layer.borderColor = color.cgColor
		lineStatusView.backgroundColor = color
		statusView.backgroundColor = color
		statusView.layer.shadowColor = color.cgColor
		lableContainerView.layer.shadowColor = color.cgColor
	}
}

// MARK: - SetupView
private extension ViewController {
	func setupView() {
		view.backgroundColor = .lightGray
		infoImageLable.isHidden = true
		infoImageLable.text = "veve"
	}
	
	func addDelegate() {
		[nextButton, firstButton, lastButton]
			.forEach{$0.delegate = self}
	}
	
	func addSubviews() {
		view.addSubviews(
			imageContainerView, lineStatusView,
			lableContainerView, stackView, firstButton, infoImageLable
		)
		imageContainerView.addSubview(imageView)
		lableContainerView.addSubview(statusView)
		lableContainerView.addSubviews(nameLable, statusLable)
		stackView.addArrangedSubviews(lastButton, nextButton)
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
		infoImageLable.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			firstButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 80),
			firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			infoImageLable.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
			infoImageLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}

//MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
	func pressedButton(_ button: UIButton) {
		switch button {
		case nextButton:
			settingStatus(
				character: characterDataManager?.getNextCharacter()
			)
		case firstButton:
			settingStatus(
				character: characterDataManager?.getFirstCharacter()
			)
		case lastButton:
			settingStatus(
				character: characterDataManager?.getLastCharacter()
			)
		default:
			break
		}
	}
}

// MARK: - Constants
private extension ViewController {
	enum Constants {
		static let fontLable = "Arial Rounded MT Bold"
		static let sizeNameLable: CGFloat = 20
		static let sizeStatusLable: CGFloat = 20
		static let imageName = "Character 1"
	}
}

//
//  FindImageViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 23.10.2024.
//

import UIKit


class FindImageViewController: UIViewController {
	
	var characterManager: ICharacterDataManager?
	
	private let presencePictureLable = CastomLable(
		font: Constants.fontLable,
		size: Constants.sizeNameLable
	)
	
	private let infoLable = CastomLable(
		font: Constants.fontLable,
		size: Constants.sizeNameLable
	)
	
	private let imageView = CastomImageView(
		imageName: Constants.imageName
	)
	
	private let castomTF = CustomTextField()
	
	private let checkButton = ShadowButton(
		text: "Проверить",
		color: .cyan
	)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		castomTF.delegate = self
		setupView()
		addSubviews()
		setupLoyaut()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let imageSearch = castomTF.text else { return }
		settingView(imageSearch)
		super.touchesBegan(touches, with: event)
	}
}

// MARK: - Private metods
private extension FindImageViewController {
	func settingView(_ imageSearch: String) {
		guard let character = characterManager?.getSearchCharacter(image: imageSearch) as? Character else {
			imageView.isHidden = true
			infoLable.isHidden = true
			presencePictureLable.text = "Введите название картинки"
			castomTF.text = ""
			view.endEditing(true)
			return
		}
		
		imageView.isHidden = false
		infoLable.isHidden = false
		
		imageView.image = UIImage(named: character.imageName)
		infoLable.text = character.name
		presencePictureLable.text = "Такая картинка есть"
		castomTF.text = ""
		view.endEditing(true)
	}
}

// MARK: - SetupView
private extension FindImageViewController {
	func setupView() {
		view.backgroundColor = .lightGray
		
		presencePictureLable.text = "Введите название картинки"
		presencePictureLable.textAlignment = .center
		
		infoLable.text = "Описание картинки"
		infoLable.textAlignment = .center

		imageView.isHidden = true
		infoLable.isHidden = true
	}
	
	func addSubviews() {
		[presencePictureLable, castomTF, checkButton, infoLable, imageView]
			.forEach{view.addSubview($0)}
	}
}

// MARK: - Setup Loyaut
private extension FindImageViewController {
	func setupLoyaut() {
		presencePictureLable.translatesAutoresizingMaskIntoConstraints = false
		castomTF.translatesAutoresizingMaskIntoConstraints = false
		checkButton.translatesAutoresizingMaskIntoConstraints = false
		imageView.translatesAutoresizingMaskIntoConstraints = false
		infoLable.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			presencePictureLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
			presencePictureLable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
			presencePictureLable.heightAnchor.constraint(equalToConstant: 50),
			presencePictureLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			castomTF.topAnchor.constraint(equalTo: presencePictureLable.bottomAnchor, constant: 50),
			castomTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
			castomTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			checkButton.topAnchor.constraint(equalTo: castomTF.bottomAnchor, constant: 30),
			checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			imageView.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 30),
			imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
			imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			infoLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
			infoLable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
			infoLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		
	}
}

extension FindImageViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		guard let imageSearch = textField.text else { return true }
		settingView(imageSearch)
		return true
	}
}


// MARK: - Constants
private extension FindImageViewController {
	enum Constants {
		static let fontLable = "Arial Rounded MT Bold"
		static let sizeNameLable: CGFloat = 20
		static let sizeStatusLable: CGFloat = 20
		static let imageName = "Character 1"
	}
}

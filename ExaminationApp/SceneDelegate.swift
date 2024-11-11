//
//  SceneDelegate.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 03.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let windowScene = scene as? UIWindowScene else { return }
		window = UIWindow(windowScene: windowScene)

		let viewController = assembly(type: .markTableViewController)
		
		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
	}
}

// MARK: - Descriptions
private extension SceneDelegate {
	func getDescription(characters: [Character]) {
		characters.forEach{print($0)}
	}
}

private extension SceneDelegate {
	func getCharacters() -> ICharacterDataManager {
		let characterDataManager: ICharactersManager = CharactersManager()
		let characterManager = CharacterDataManager(characters: characterDataManager.getCharacters())
		return characterManager
	}
	
	func assembly(type: TypeViewController) -> UIViewController {
		let manager = getCharacters()
		
		switch type {
		case .viewController:
			let viewController = ViewController()
			viewController.characterDataManager = manager
			return viewController
		case .findImageViewController:
			let viewController = FindImageViewController()
			viewController.characterManager = manager
			return viewController
		case .panImageViewController:
			let viewController = PanImageViewController()
			viewController.characterManager = manager
			return viewController
		case .licenseViewController:
			return LicenseAgreementViewController()
		case .imageListViewcontroller:
			let viewController = ImageListViewController()
			viewController.characterManager = manager
			return viewController
		case .markTableViewController:
			let viewController = MarkTableViewController()
			viewController.characterManager = manager
			return viewController
		}
	}
	
	enum TypeViewController {
		case viewController
		case findImageViewController
		case panImageViewController
		case licenseViewController
		case imageListViewcontroller
		case markTableViewController
	}
}

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
		
		let characters = CharactersManager.getCharacters().sorted{
			$0.imageName < $1.imageName
		}
		getDescription(characters: characters)

		let charactersDataManager = CharacterDataManager(
			characters: characters
		)
		let viewController = ViewController()
		viewController.characterDataManager = charactersDataManager
		
		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}
}

// MARK: - Descriptions
private extension SceneDelegate {
	func getDescription(characters: [Character]) {
		characters.forEach{print($0)}
	}
}

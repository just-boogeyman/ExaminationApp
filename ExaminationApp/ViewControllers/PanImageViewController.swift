//
//  PanImageViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 27.10.2024.
//

import UIKit

class PanImageViewController: UIViewController {
	
	// MARK: - Public Properties
	var characterManager: CharacterDataManager?
	
	// MARK: - Private Properties
	private var topConstraint: NSLayoutConstraint!
	private var centerXConstraint: NSLayoutConstraint!
	private var panGestureAnchorPoint: CGPoint?
	
	private let imageView = CastomImageView(
		imageName: Constants.startImage
	)
	private let containerView = ShadowView(color: .cyan)
	private let panGestureRecognizer = UIPanGestureRecognizer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupImageView()
		setupLayout()
		setupGestureRecognizer()
	}
	
	@objc
	func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
		guard panGestureRecognizer === gestureRecognizer else {
			return
		}
		
		switch gestureRecognizer.state {
		case .possible:
			break
		case .began:
			panGestureAnchorPoint = gestureRecognizer.location(in: view)
			shadowView(true)
		case .changed:
			guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
			let gesturePoint = gestureRecognizer.location(in: view)
			
			centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
			topConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
			self.panGestureAnchorPoint = gesturePoint
		case .cancelled:
			panGestureAnchorPoint = nil
		case .ended:
			panGestureAnchorPoint = nil
			settingStatus(
				character: characterManager?.getRandomCharacter()
			)
			shadowView(false)
		@unknown default:
			break
		}
	}
}


// MARK: - Private Metods
private extension PanImageViewController {
	func settingStatus(character: Character?) {
		guard let characters = character else { return }
		imageView.image = UIImage(named: characters.imageName)

		switch characters.status {
		case .alive:
			setupColor(color: Constants.colorAlive)
		case .dead:
			setupColor(color: Constants.colorDead)
		case .unknown:
			setupColor(color: Constants.colorUnknown)
		}
	}
	
	func setupColor(color: CGColor) {
		containerView.layer.shadowColor = color
		imageView.layer.borderColor = color
	}
}

// MARK: - Setup View
private extension PanImageViewController {
	func setupImageView() {
		view.addSubview(containerView)
		containerView.addSubview(imageView)
		view.backgroundColor = .lightGray
	}
	
	func setupGestureRecognizer() {
		panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
		panGestureRecognizer.maximumNumberOfTouches = 1
		
		containerView.addGestureRecognizer(panGestureRecognizer)
	}
	
	func shadowView(_ onOff: Bool) {
		if onOff {
			containerView.layer.shadowRadius = Constants.cornerRadius
			containerView.layer.shadowOpacity = Constants.shadowOpacity
			containerView.layer.shadowOffset = Constants.shadowOffset
		} else {
			containerView.layer.shadowOpacity = Constants.shadowOpacityOff
		}
	}
}

// MARK: - Setup Layout
extension PanImageViewController {
	private func setupLayout() {
		[containerView, imageView]
			.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
		
		
		let widthConstraint = containerView.widthAnchor.constraint(
			equalToConstant: Constants.initialBoxDimSize
		)
		let heightConstraint = containerView.heightAnchor.constraint(
			equalToConstant: Constants.initialBoxDimSize
		)
		
		topConstraint = containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
		centerXConstraint = containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		
		NSLayoutConstraint.activate([
			widthConstraint,
			heightConstraint,
			topConstraint,
			centerXConstraint,
			
			imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
			imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
			imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor)
		])
	}
}

// MARK: - Constants
private extension PanImageViewController {
	enum Constants {
		static let boxCornerRadius: CGFloat = 10.0
		static let initialBoxDimSize: CGFloat = 150.0
		static let shadowOpacity: Float = 0.5
		static let shadowOpacityOff: Float = 0
		static let shadowOffset = CGSize(width: 5.0, height: 5.0)
		static let cornerRadius: CGFloat = 20
		static let colorUnknown = UIColor.cyan.cgColor
		static let colorAlive = UIColor.green.cgColor
		static let colorDead = UIColor.red.cgColor
		static let startImage = "1"
	}
}

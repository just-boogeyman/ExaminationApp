//
//  PanImageViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 27.10.2024.
//

import UIKit

class PanImageViewController: UIViewController {
	
	var characterManager: CharacterDataManager?
	
	private var centerYConstraint: NSLayoutConstraint!
	private var centerXConstraint: NSLayoutConstraint!
	
	private let imageView = CastomImageView(
		imageName: "1"
	)
	
	private let containerView = ShadowView(color: .cyan)
	
	private let panGestureRecognizer = UIPanGestureRecognizer()
	private var panGestureAnchorPoint: CGPoint?
	
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
			centerYConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
			self.panGestureAnchorPoint = gesturePoint
		case .cancelled:
			panGestureAnchorPoint = nil
		case .ended:
			panGestureAnchorPoint = nil
			containerView.layer.shadowColor = UIColor.green.cgColor
			shadowView(false)
			guard let character = characterManager?.getRandomCharacter() else { return }
			imageView.image = UIImage(named: character.imageName)
		@unknown default:
			break
		}
	}
}

// MARK: - Setup View
extension PanImageViewController {
	private func setupImageView() {
		view.addSubview(containerView)
		containerView.addSubview(imageView)
		view.backgroundColor = .lightGray
	}
	
	private func setupGestureRecognizer() {
		panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
		panGestureRecognizer.maximumNumberOfTouches = 1
		
		containerView.addGestureRecognizer(panGestureRecognizer)
	}
	
	private func shadowView(_ onOff: Bool) {
		if onOff {
			containerView.layer.shadowColor = Constants.shadowColorOn
			containerView.layer.shadowRadius = Constants.cornerRadius
			containerView.layer.shadowOpacity = Constants.shadowOpacity
			containerView.layer.shadowOffset = Constants.shadowOffset
		} else {
			containerView.layer.shadowOpacity = Constants.shadowOpacity
		}
		
	}
}

// MARK: - Setup Layout
extension PanImageViewController {
	private func setupLayout() {
		containerView.translatesAutoresizingMaskIntoConstraints = false
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		let widthConstraint = containerView.widthAnchor.constraint(
			equalToConstant: Constants.initialBoxDimSize
		)
		let heightConstraint = containerView.heightAnchor.constraint(
			equalToConstant: Constants.initialBoxDimSize
		)
		
		centerYConstraint = containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
		centerXConstraint = containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		
		NSLayoutConstraint.activate([
			widthConstraint,
			heightConstraint,
			centerYConstraint,
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
		static let shadowOffset = CGSize(width: 5.0, height: 5.0)
		static let cornerRadius: CGFloat = 20
		static let shadowColorOn = UIColor.cyan.cgColor
		static let shadowOpacityOff = 0
	}
}

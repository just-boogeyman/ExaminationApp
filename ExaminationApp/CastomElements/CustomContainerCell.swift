//
//  CustomContainerCell.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 12.11.2024.
//

import UIKit


class CustomContainerView: UIView {
	
	// MARK: - Private View
	private let nameLable = UILabel()
	private let statusLable = UILabel()
	
	private let imageCharacter = CastomImageView(imageName: "1")
	
	private let viewLife = UIView()
	private let markButton = UIButton()
	private var toggleMark = false
	
	var action: (() -> ())?
	
	init(shadow: Bool = false) {
		super.init(frame: .zero)
		setupView(shadow: shadow)
		setup()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		let shadowPath = UIBezierPath(rect: bounds)
		layer.shadowPath = shadowPath.cgPath
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		touchEvent()
	}
	
	func configure(character: Character) {
		imageCharacter.image = UIImage(named: character.imageName)
		nameLable.text = character.name
		statusLable.text = "\(character.status) - \(character.species)"
		toggleMark = character.isMark
		
		let mark = toggleMark ? "checkmark.square.fill" : "checkmark.square"
		markButton.setImage(UIImage(systemName: mark), for: .normal)
		
		switch character.status {
		case .alive:
			settingColor(.green)
		case .dead:
			settingColor(.red)
		case .unknown:
			settingColor(.systemCyan)
		}
	}
	
	@objc
	private func toggleMarkButton() {
		toggleMark.toggle()
		let mark = toggleMark ? "checkmark.square.fill" : "checkmark.square"
		markButton.setImage(UIImage(systemName: mark), for: .normal)
		action?()
	}
}

// MARK: - SetupView
extension CustomContainerView {
	private func setupView(shadow: Bool) {
		backgroundColor = UIColor(cgColor: CGColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1))
		layer.cornerRadius = 20
		if shadow {
			layer.shadowColor = UIColor.darkGray.cgColor
			layer.shadowRadius = 10
			layer.shadowOpacity = Constants.shadowOpacity
			layer.shadowOffset = Constants.shadowOffset
		}
	}
}


// MARK: - Private Metods
private extension CustomContainerView {
	func settingColor(_ color: UIColor) {
		imageCharacter.layer.borderColor = color.cgColor
		viewLife.backgroundColor = color
	}
	
	func setupButton() {
		markButton.addTarget(self, action: #selector(toggleMarkButton), for: .touchUpInside)
	}
	
	func touchEvent() {
		UIView.animate(withDuration: 0.3) {
			self.backgroundColor = UIColor(
				cgColor: CGColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
			)
			self.layer.shadowOffset = CGSize(width: 2, height: 2)
		} completion: { _ in
			self.backgroundColor = UIColor(
				cgColor: CGColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
			)
			self.layer.shadowOffset = CGSize(width: 5, height: 5)
		}
	}
}

// MARK: - Setup View
private extension CustomContainerView {
	func setup() {
		[nameLable, statusLable,
		 imageCharacter,
		 markButton, viewLife].forEach{addSubview($0)}
		setupImage()
		setupNameLabel()
		setupButton()
		setupLayout()
	}
	
	func setupNameLabel() {
		nameLable.font = .boldSystemFont(ofSize: 20)
	}
	
	func setupImage() {
		imageCharacter.widthAnchor.constraint(equalToConstant: 100).isActive = true
		imageCharacter.heightAnchor.constraint(equalToConstant: 100).isActive = true
		imageCharacter.contentMode = .scaleAspectFill
	}
}

// MARK: - Layout
private extension CustomContainerView {
	func setupLayout() {
		[viewLife, nameLable, imageCharacter, markButton, statusLable]
			.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
		let constraint = imageCharacter.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
		constraint.priority = .defaultLow

		
		NSLayoutConstraint.activate([

			imageCharacter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
			imageCharacter.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			constraint,
			
			nameLable.leadingAnchor.constraint(equalTo: imageCharacter.trailingAnchor, constant: 16),
			nameLable.topAnchor.constraint(equalTo: topAnchor, constant: 32),
			nameLable.trailingAnchor.constraint(equalTo: markButton.leadingAnchor, constant: -8),
			
			viewLife.centerYAnchor.constraint(equalTo: imageCharacter.centerYAnchor),
			viewLife.leadingAnchor.constraint(equalTo: imageCharacter.trailingAnchor),
			viewLife.trailingAnchor.constraint(equalTo: trailingAnchor),
			viewLife.heightAnchor.constraint(equalToConstant: 3),
			
			statusLable.leadingAnchor.constraint(equalTo: imageCharacter.trailingAnchor, constant: 16),
			statusLable.topAnchor.constraint(equalTo: viewLife.bottomAnchor, constant: 8),
			statusLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
			
			markButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			markButton.centerYAnchor.constraint(equalTo: nameLable.centerYAnchor),
			markButton.widthAnchor.constraint(equalToConstant: 36),
			markButton.heightAnchor.constraint(equalToConstant: 36)
		])
	}
}


// MARK: - Constants
private extension CustomContainerView {
	enum Constants {
		static let shadowOpacity: Float = 3
		static let shadowOffset = CGSize(width: 5.0, height: 5.0)
	}
}

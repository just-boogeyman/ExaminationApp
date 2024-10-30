//
//  LicenseAgreementViewController.swift
//  ExaminationApp
//
//  Created by Ярослав Кочкин on 30.10.2024.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
		
	private let scrollView = UIScrollView()
	private let contentView = ShadowView(color: .cyan, shadow: true)
	private let titleLable = CastomLable(font: "Arial Rounded MT Bold", size: 16)
	private let textLable = CastomLable(font: "Arial Rounded MT Bold", size: 12)

	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
}


// MARK: - Setting View
private extension LicenseAgreementViewController {
	func setupView() {
		view.backgroundColor = .lightGray
		addSubviews()
		settupScrollView()
		setupContentView()
		setupLable()
		setupLayout()
	}
	
	func addSubviews() {
		view.addSubview(scrollView)
	}
}

// MARK: - Setting Subviews
private extension LicenseAgreementViewController {
	
	func settupScrollView() {
		scrollView.backgroundColor = .lightGray
		scrollView.addSubview(contentView)
	}
	
	func setupContentView() {
		contentView.backgroundColor = .white
		contentView.addSubviews(titleLable, textLable)
	}
	
	func setupLable() {
		titleLable.text = TextManager.title
		textLable.text = TextManager.text
		textLable.textAlignment = .justified
		titleLable.textColor = .black
		textLable.textColor = .black
		titleLable.numberOfLines = 0
		textLable.numberOfLines = 0
	}
}

// MARK: - Layout
private extension LicenseAgreementViewController {
	func setupLayout() {
		[scrollView, contentView, textLable, titleLable]
			.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
			contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.heightAnchor.constraint(equalToConstant: 1000),
			
			titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
			titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			titleLable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

			textLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 16),
			textLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			textLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			textLable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
		])
	}
}

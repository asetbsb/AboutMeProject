//
//  AboutMePage.swift
//  AboutMeProject
//
//  Created by Asset on 10/3/24.
//

import UIKit

class AboutMePage: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.alignment = .center
        mainStackView.spacing = 25
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return stackView
    }()
    
    private let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AboutMe")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 85
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Asset Bissenbayev"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstHeader: UILabel = {
        let label = UILabel()
        label.text = "Gender and age"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstInfo: UILabel = {
        let label = UILabel()
        label.text = "Male, 21"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondHeader: UILabel = {
        let label = UILabel()
        label.text = "Job title and Company"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondInfo: UILabel = {
        let label = UILabel()
        label.text = "iOS Intern, Yandex"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioHeader: UILabel = {
        let label = UILabel()
        label.text = "About me"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum lorem Lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum lorem Lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum lorem Lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum lorem Lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum lorem Lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum lorem"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "linkedinIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 100
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "githubIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 100
        return button
    }()
    
    private func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(userImage)
        mainStackView.addArrangedSubview(nameLabel)
        mainStackView.addArrangedSubview(stackView)
        mainStackView.addArrangedSubview(bottomStackView)
        stackView.addArrangedSubview(firstHeader)
        stackView.addArrangedSubview(firstInfo)
        stackView.addArrangedSubview(secondHeader)
        stackView.addArrangedSubview(secondInfo)
        stackView.addArrangedSubview(bioHeader)
        stackView.addArrangedSubview(bioLabel)
        bottomStackView.addArrangedSubview(firstButton)
        bottomStackView.addArrangedSubview(secondButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        firstButton.addTarget(self, action: #selector(openLinkedInProfile), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(openGitHubProfile), for: .touchUpInside)
        addSubViews()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            // Important: mainStackView's width should be equal to the scrollView's frame width
            mainStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 170),
            userImage.widthAnchor.constraint(equalToConstant: 170),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            firstButton.widthAnchor.constraint(equalToConstant: 50),
            secondButton.heightAnchor.constraint(equalToConstant: 50),
            secondButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc private func openLinkedInProfile() {
        if let url = URL(string: "https://www.linkedin.com/in/asset-bsb/") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func openGitHubProfile() {
        if let url = URL(string: "https://github.com/asetbsb") {
            UIApplication.shared.open(url)
        }
    }
}

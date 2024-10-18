//
//  ViewController.swift
//  AboutMeProject
//
//  Created by Asset on 10/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Click me!", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let hintButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hint?", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let eggButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to eggScreen", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        setupUI()
        incrementButton.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        hintButton.addTarget(self, action: #selector(showHintAlert), for: .touchUpInside)
        eggButton.addTarget(self, action: #selector(goToEgg), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(incrementButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            incrementButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(hintButton)
        
        NSLayoutConstraint.activate([
            hintButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hintButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            hintButton.widthAnchor.constraint(equalToConstant: 80),
            hintButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(eggButton)
        
        NSLayoutConstraint.activate([
            eggButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eggButton.topAnchor.constraint(equalTo: hintButton.bottomAnchor, constant: 20),
            eggButton.widthAnchor.constraint(equalToConstant: 150),
            eggButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func incrementCount() {
        if count < 3 {
            count += 1
            countLabel.text = "\(count)"
        } else {
            let newScreen = AboutMePage()
            self.navigationController?.pushViewController(newScreen, animated: true)
        }
    }
    
    @objc private func goToEgg() {
        let newScreen = EggTimerScreen()
        self.navigationController?.pushViewController(newScreen, animated: true)
    }
    
    @objc private func showHintAlert() {
        let alertController = UIAlertController(title: "Hint", message: "Press at least 3 times to view new screen!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

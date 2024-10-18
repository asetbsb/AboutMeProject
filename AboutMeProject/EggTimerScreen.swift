//
//  EggTimerScreen.swift
//  AboutMeProject
//
//  Created by Asset on 10/5/24.
//

import UIKit
import AVFoundation

final class EggTimerScreen: UIViewController {
    
    private let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    private var timer = Timer()
    private var player: AVAudioPlayer!
    private var totalTime = 0
    private var secondsPassed = 0
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let topStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    private let middleStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .center
        mainStackView.spacing = 10
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose the egg!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var softEgg: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "soft_egg"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("Soft", for: .normal)
        button.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        return button
    }()
    
    private let mediumEgg: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "medium_egg"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("Medium", for: .normal)
        return button
    }()
    
    private let hardEgg: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hard_egg"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("Hard", for: .normal)
        return button
    }()
    
    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.progressTintColor = .systemYellow
        progressBar.trackTintColor = .systemGray
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        addButtonTargets()
        setupUI()
    }
    
    private func addButtonTargets() {
//        softEgg.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        mediumEgg.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        hardEgg.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(middleStackView)
        mainStackView.addArrangedSubview(bottomStackView)
        topStackView.addArrangedSubview(topLabel)
        middleStackView.addArrangedSubview(softEgg)
        middleStackView.addArrangedSubview(mediumEgg)
        middleStackView.addArrangedSubview(hardEgg)
        bottomStackView.addArrangedSubview(progressBar)
    }
    
    private func setupUI() {
        addSubviews()
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            bottomStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 25),
            bottomStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -25),
            
            softEgg.widthAnchor.constraint(equalTo: mediumEgg.widthAnchor),
            mediumEgg.widthAnchor.constraint(equalTo: hardEgg.widthAnchor),
            softEgg.heightAnchor.constraint(equalTo: mediumEgg.heightAnchor),
            mediumEgg.heightAnchor.constraint(equalTo: hardEgg.heightAnchor),
            
            topLabel.centerYAnchor.constraint(equalTo: topStackView.centerYAnchor),
            
            progressBar.centerYAnchor.constraint(equalTo: bottomStackView.centerYAnchor),
            progressBar.centerXAnchor.constraint(equalTo: bottomStackView.centerXAnchor),
            progressBar.widthAnchor.constraint(equalTo: bottomStackView.widthAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    @objc private func resetTimer(_ sender: UIButton) {
        timer.invalidate()
        guard let hardness = sender.currentTitle, let time = eggTimes[hardness] else { return }
        totalTime = time

        progressBar.progress = 0.0
        secondsPassed = 0
        topLabel.text = hardness

        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc private func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            
            // Update UI on the main thread
            DispatchQueue.main.async {
                self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
                print(Float(self.secondsPassed) / Float(self.totalTime))
            }
        } else {
            timer.invalidate()
            DispatchQueue.main.async {
                self.topLabel.text = "DONE!"
                
                guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
                    print("Alarm sound file not found")
                    return
                }
                
                do {
                    self.player = try AVAudioPlayer(contentsOf: url)
                    self.player.play()
                } catch {
                    print("Error initializing audio player: \(error.localizedDescription)")
                }
            }
        }
    }
}

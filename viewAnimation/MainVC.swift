//
//  MainVC.swift
//  viewAnimation
//
//  Created by Bayram Yeleç on 25.01.2025.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    private let toggleView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    private let buttonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    
    private let toggleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let button1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "instagram"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "linkedin"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "github"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isToggled: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        
        title = "Animation"
        
        view.addSubview(toggleView)
        toggleView.backgroundColor = .clear
        toggleView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(90)
        }
        
        toggleView.addSubview(buttonContainer)
        buttonContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(50)
        }
        
        toggleView.addSubview(toggleButton)
        toggleButton.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        toggleButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(50)
        }
        
        toggleView.addSubview(buttonStackView)
        buttonStackView.alpha = 0
        buttonStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        buttonStackView.addArrangedSubview(button1)
        button1.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        buttonStackView.addArrangedSubview(button2)
        button2.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        buttonStackView.addArrangedSubview(button3)
        button3.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        
    }
    
    @objc func toggleButtonTapped() {
        isToggled.toggle()
        animatingView()
    }
    
    private func animatingView() {
        
        if isToggled {
            UIView.animate(withDuration: 0.4) {
                self.buttonContainer.transform = CGAffineTransform(scaleX: 15, y: 15)
                self.toggleButton.transform = CGAffineTransform(rotationAngle: -.greatestFiniteMagnitude)
                self.view.layoutIfNeeded()
            } completion: { _ in
                
                UIView.animate(withDuration: 0.4) {
                    self.toggleView.snp.updateConstraints { make in
                        make.height.equalTo(200)
                    }
                    self.view.layoutIfNeeded()
                    
                } completion: { _ in
                    
                    UIView.animate(withDuration: 0.2) {
                        self.buttonStackView.alpha = 1
                    }
                    
                }
            }
            
        } else {
            UIView.animate(withDuration: 0.2) {
                self.buttonStackView.alpha = 0
            } completion: { _ in
                
                UIView.animate(withDuration: 0.4) {
                    self.toggleView.snp.updateConstraints { make in
                        make.height.equalTo(90)
                    }
                    self.view.layoutIfNeeded()
                    
                } completion: { _ in
                    
                    UIView.animate(withDuration: 0.5) {
                        self.buttonContainer.transform = .identity
                        self.toggleButton.transform = .identity
                        self.view.layoutIfNeeded()
                        
                    }
                }
            }
        }
        
    }
    
    
}

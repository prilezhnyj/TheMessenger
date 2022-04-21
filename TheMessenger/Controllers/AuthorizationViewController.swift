//
//  ViewController.swift
//  TheMessenger
//
//  Created by Максим Боталов on 21.04.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    
    let welcomeUpperLabel = UILabel(text: "Добро пожаловать", color: .black, alignment: .left, font: SetupFont.avenirHeavy(sizeFont: 28))
    let welcomeLowerLabel = UILabel(text: "в дружелюбный месседжер", color: .black, alignment: .left, font: SetupFont.avenirRoman(sizeFont: 17))
    
    let registrationButton = UIButton(titleText: "Регистрация", titleFont: SetupFont.avenirRoman(sizeFont: 17), titleColor: .white, backgroundColor: .black, cornerRadius: 20, isShadow: true, isBorder: false)
    let authorizationButton = UIButton(titleText: "Авторизация", titleFont: SetupFont.avenirRoman(sizeFont: 17), titleColor: .black, backgroundColor: .white, cornerRadius: 20, isShadow: false, isBorder: true)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
}

extension AuthorizationViewController {
    private func setupConstraints() {
        
        let welcomeLabelStackView = UIStackView(arrangedSubviews: [welcomeUpperLabel, welcomeLowerLabel], distribution: .fillEqually, axis: .vertical, spacing: 0, alignment: .fill)
        
        let buttonStackView = UIStackView(arrangedSubviews: [authorizationButton, registrationButton], distribution: .fillEqually, axis: .vertical, spacing: 10, alignment: .fill)
        
        view.addSubview(welcomeLabelStackView)
        NSLayoutConstraint.activate([
            welcomeLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            welcomeLabelStackView.heightAnchor.constraint(equalToConstant: 61),
            welcomeLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            welcomeLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 110),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)])
    }
}


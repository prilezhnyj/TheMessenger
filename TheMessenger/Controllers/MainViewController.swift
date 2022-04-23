//
//  ViewController.swift
//  TheMessenger
//
//  Created by Максим Боталов on 21.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "🎉 Welcome", color: .black, alignment: .left, font: SetupFont.sfProBold(sizeFont: 28))
    
    let discriptionLabel = UILabel(text: discription, color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 17))
    
    let loginInButton = UIButton(titleText: "Login In", titleFont: SetupFont.sfProBold(sizeFont: 17), titleColor: .white, backgroundColor: .black, cornerRadius: 25, isShadow: false, isBorder: false)
    let signUpButton = UIButton(titleText: "Sign Up", titleFont: SetupFont.sfProBold(sizeFont: 17), titleColor: .black, backgroundColor: .white, cornerRadius: 25, isShadow: true, isBorder: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
}

extension MainViewController {
    private func setupConstraints() {
        let buttonStackView = UIStackView(arrangedSubviews: [loginInButton, signUpButton], distribution: .fill, axis: .vertical, spacing: 20, alignment: .fill)
        
        let generalStackView = UIStackView(arrangedSubviews: [welcomeLabel, discriptionLabel, buttonStackView], distribution: .fill, axis: .vertical, spacing: 60, alignment: .fill)
        
        view.addSubview(generalStackView)
        NSLayoutConstraint.activate([
            generalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
    }
}


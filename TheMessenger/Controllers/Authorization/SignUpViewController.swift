//
//  SignUpViewController.swift
//  TheMessenger
//
//  Created by Максим Боталов on 22.04.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let headerLabel = UILabel(text: "The registration", color: .black, alignment: .left, font: SetupFont.sfProBold(sizeFont: 28))
    
    let emailLabel = UILabel(text: "Your mailbox", color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 15))
    let emailTextField = CustomTextField(font: SetupFont.sfProRegular(sizeFont: 17), isSecure: false)
    
    let passwordLabel = UILabel(text: "Enter your password", color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 15))
    let passwordTextField = CustomTextField(font: SetupFont.sfProRegular(sizeFont: 17), isSecure: true)
    
    let confirmPasswordLabel = UILabel(text: "Enter your password again", color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 15))
    let confirmPasswordTextField = CustomTextField(font: SetupFont.sfProRegular(sizeFont: 17), isSecure: true)
    
    let signUpButton = UIButton(titleText: "Sign Up", titleFont: SetupFont.sfProBold(sizeFont: 17), titleColor: .white, backgroundColor: .black, cornerRadius: 25, isShadow: true, isBorder: false)
    
    let forgotPasswordLabel = UILabel(text: "Already have an account?", color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 15))
    let forgotPasswordButton = UIButton(titleText: "Login In", titleFont: SetupFont.sfProBold(sizeFont: 15), titleColor: .black, backgroundColor: .clear, cornerRadius: 0, isShadow: true, isBorder: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
        view.backgroundColor = .white
    }
}

extension SignUpViewController {
    private func setupConstraints() {
        
        let emailView = CustomForTextFieldView(label: emailLabel, textField: emailTextField)
        let passwordView = CustomForTextFieldView(label: passwordLabel, textField: passwordTextField)
        let confirmPasswordView = CustomForTextFieldView(label: confirmPasswordLabel, textField: confirmPasswordTextField)
        
        let textFieldsViewsStackView = UIStackView(arrangedSubviews: [emailView, passwordView, confirmPasswordView], distribution: .fill, axis: .vertical, spacing: 20, alignment: .fill)
        let forgotPasswordStackView = UIStackView(arrangedSubviews: [forgotPasswordLabel, forgotPasswordButton], distribution: .fill, axis: .horizontal, spacing: 10, alignment: .leading)
        let buttonStackView = UIStackView(arrangedSubviews: [signUpButton, forgotPasswordStackView], distribution: .fill, axis: .vertical, spacing: 20, alignment: .fill)
        
        forgotPasswordStackView.alignment = .firstBaseline
        forgotPasswordButton.contentHorizontalAlignment = .leading
        
        view.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -457),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        view.addSubview(textFieldsViewsStackView)
        NSLayoutConstraint.activate([
            textFieldsViewsStackView.heightAnchor.constraint(equalToConstant: 173),
            textFieldsViewsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -224),
            textFieldsViewsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textFieldsViewsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.heightAnchor.constraint(equalToConstant: 104),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
    }
}

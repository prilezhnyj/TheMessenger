//
//  SetupProfileViewController.swift
//  TheMessenger
//
//  Created by Максим Боталов on 23.04.2022.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let headerLabel = UILabel(text: "Set up profile", color: .black, alignment: .left, font: SetupFont.sfProBold(sizeFont: 28))
    
    let fullNamelLabel = UILabel(text: "Your full name", color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 15))
    let fullNameTextField = CustomTextField(font: SetupFont.sfProRegular(sizeFont: 17), isSecure: false)
    
    let aboutLabel = UILabel(text: "About me", color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 15))
    let aboutTextField = CustomTextField(font: SetupFont.sfProRegular(sizeFont: 17), isSecure: true)
    
    let sexLabel = UILabel(text: "Sex", color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 15))
    let sexChoise: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let goToChatsButton = UIButton(titleText: "Go to chats", titleFont: SetupFont.sfProBold(sizeFont: 15), titleColor: .white, backgroundColor: .black, cornerRadius: 25, isShadow: false, isBorder: false)
    
    let addPhoto = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
}

extension SetupProfileViewController {
    private func setupConstraints() {
        
        let fullNameView = CustomForTextFieldView(label: fullNamelLabel, textField: fullNameTextField)
        let aboutView = CustomForTextFieldView(label: aboutLabel, textField: aboutTextField)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexChoise], distribution: .fill, axis: .vertical, spacing: 10, alignment: .fill)
        let textFieldsViewsStackView = UIStackView(arrangedSubviews: [fullNameView, aboutView, sexStackView], distribution: .fill, axis: .vertical, spacing: 20, alignment: .fill)
        
        view.addSubview(goToChatsButton)
        NSLayoutConstraint.activate([
            goToChatsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            goToChatsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            goToChatsButton.heightAnchor.constraint(equalToConstant: 50),
            goToChatsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60)])
        
        view.addSubview(textFieldsViewsStackView)
        NSLayoutConstraint.activate([
            textFieldsViewsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textFieldsViewsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textFieldsViewsStackView.bottomAnchor.constraint(equalTo: goToChatsButton.topAnchor, constant: -100)])
        
        view.addSubview(addPhoto)
        addPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhoto.bottomAnchor.constraint(equalTo: textFieldsViewsStackView.topAnchor, constant: -100)])
    }
}

//
//  CustomTextField.swift
//  TheMessenger
//
//  Created by Максим Боталов on 22.04.2022.
//

import UIKit

class CustomTextField: UITextField {
    convenience init(font: UIFont, isSecure: Bool) {
        self.init()
        self.font = font
        self.textColor = .black
        self.borderStyle = .none
        self.autocapitalizationType = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clearButtonMode = .always
        
        if isSecure == true {
            self.isSecureTextEntry = true
        } else {
            self.isSecureTextEntry = false
        }
        
        var bottomLineView = UIView()
        bottomLineView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bottomLineView.backgroundColor = .black
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bottomLineView)
        bottomLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
}

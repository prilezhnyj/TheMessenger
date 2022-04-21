//
//  UILabel.swift
//  TheMessenger
//
//  Created by Максим Боталов on 21.04.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, color: UIColor, alignment: NSTextAlignment, font: UIFont) {
        self.init()
        self.text = text
        self.textColor = color
        self.textAlignment = alignment
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

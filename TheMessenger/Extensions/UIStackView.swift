//
//  UIStackView.swift
//  TheMessenger
//
//  Created by Максим Боталов on 21.04.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis, spacing: CGFloat, alignment: UIStackView.Alignment) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.distribution = distribution
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.contentHuggingPriority(for: .horizontal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

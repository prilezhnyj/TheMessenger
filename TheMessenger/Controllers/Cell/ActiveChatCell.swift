//
//  ActiveChatCell.swift
//  TheMessenger
//
//  Created by Максим Боталов on 26.04.2022.
//

import UIKit

protocol SelfConfigurationCell {
    static var id: String { get }
    func configure(with value: MChat)
}

class ActiveChatCell: UICollectionViewCell, SelfConfigurationCell {
    static var id: String = "ActiveChatCell"
    
    let frendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let gradientView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let frendName = UILabel(text: "User name", color: .black, alignment: .left, font: SetupFont.sfProBold(sizeFont: 17))
    let lastMessage = UILabel(text: "Hello World", color: .black, alignment: .left, font: SetupFont.sfProRegular(sizeFont: 14))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with value: MChat) {
        frendImageView.image = UIImage(named: value.userImageString)
        frendName.text = value.username
        lastMessage.text = value.lastMessage
    }
    
    private func setupConstraints() {
        
        self.addSubview(frendImageView)
        NSLayoutConstraint.activate([
            frendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            frendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            frendImageView.heightAnchor.constraint(equalToConstant: 88),
            frendImageView.widthAnchor.constraint(equalToConstant: 88)])
        
        self.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: self.frame.height),
            gradientView.widthAnchor.constraint(equalToConstant: 10)])
        
        
        let nameStackView = UIStackView(arrangedSubviews: [frendName, lastMessage], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        
        self.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.leadingAnchor.constraint(equalTo: frendImageView.trailingAnchor, constant: 10),
            nameStackView.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -10),
            nameStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        
        
        
        
    }
}

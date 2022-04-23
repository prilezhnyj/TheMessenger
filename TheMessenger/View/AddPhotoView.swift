//
//  AddPhotoView.swift
//  TheMessenger
//
//  Created by Максим Боталов on 23.04.2022.
//

import UIKit

class AddPhotoView: UIView {
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "plus")
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        
        self.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: addPhotoButton.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addPhotoButton.clipsToBounds = true
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.height / 2
    }
    
    private func setupConstraints() {
        self.addSubview(photoImageView)
        self.addSubview(addPhotoButton)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            photoImageView.heightAnchor.constraint(equalToConstant: 100),
            photoImageView.widthAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([
            addPhotoButton.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            addPhotoButton.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 20),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 30),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 30)])
    }
}

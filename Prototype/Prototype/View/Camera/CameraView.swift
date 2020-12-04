//
//  CameraView.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit

class CameraView:UIView{
    
    //Variables
    
    //UI components
    
    let buttonRegister:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.title(for: .normal)
        button.isHidden = true
        button.setTitle("Registrar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let faceView:FaceView = {
        let view = FaceView(frame: .zero)
        view.backgroundColor = .clear
        view.layer.zPosition = 0
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageSmile: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.image = UIImage(named: "Happy")
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imageFear: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.image = UIImage(named: "Scare")
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CameraView:ViewCodable{
    func setupViewHierarchy() {
        self.addSubview(imageSmile)
        self.addSubview(imageFear)
        self.addSubview(buttonRegister)
        self.addSubview(faceView)
        self.layer.addSublayer(faceView.layer)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageFear.widthAnchor.constraint(equalToConstant: 100),
            imageFear.heightAnchor.constraint(equalToConstant: 100),
            imageFear.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageFear.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageSmile.widthAnchor.constraint(equalToConstant: 100),
            imageSmile.heightAnchor.constraint(equalToConstant: 100),
            imageSmile.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageSmile.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            faceView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            faceView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            faceView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            faceView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            buttonRegister.widthAnchor.constraint(equalToConstant: 200),
            buttonRegister.heightAnchor.constraint(equalToConstant: 60),
            buttonRegister.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonRegister.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -50)
        ])
    }
}

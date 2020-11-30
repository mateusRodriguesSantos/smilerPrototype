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
    
    let labelCamera: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "😀"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        label.isHidden = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        self.addSubview(labelCamera)
        self.addSubview(buttonRegister)
        self.addSubview(faceView)
        self.layer.addSublayer(faceView.layer)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            labelCamera.widthAnchor.constraint(equalToConstant: 200),
            labelCamera.heightAnchor.constraint(equalToConstant: 60),
            labelCamera.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelCamera.centerYAnchor.constraint(equalTo: self.centerYAnchor),
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

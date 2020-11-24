//
//  SettingsView.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit

class SettingsView:UIView{
    
    //Variables
    
    //UI components
    
    let buttonCam:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.title(for: .normal)
        button.setTitle("Camera", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsView:ViewCodable{
    func setupViewHierarchy() {
        self.addSubview(buttonCam)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonCam.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonCam.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonCam.widthAnchor.constraint(equalToConstant: 300),
            buttonCam.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}

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
    
    let backgroundSettings: UIImageView = {
        let background = UIImageView(image: UIImage(named: "background"))
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    //Provisorio
    let happyFaceButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Happy"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.setTitle("Alegria", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.centerLabelVerticallyWithPadding(spacing: 150)
        
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
        self.setupBackground()
        self.addSubview(buttonCam)
        self.addSubview(happyFaceButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonCam.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            buttonCam.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonCam.widthAnchor.constraint(equalToConstant: 300),
            buttonCam.heightAnchor.constraint(equalToConstant: 30),
            
            
            //Bacground Settings Constraints
            backgroundSettings.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundSettings.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundSettings.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundSettings.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            
            //Happy Face Button Constraints
            happyFaceButton.widthAnchor.constraint(equalToConstant: 100),
            happyFaceButton.heightAnchor.constraint(equalToConstant: 100),
            happyFaceButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            happyFaceButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupBackground(){
        self.addSubview(backgroundSettings)
    }
}

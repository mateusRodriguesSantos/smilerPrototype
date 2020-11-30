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
    let scareFaceButton: UIButton = {
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
        self.addSubview(scareFaceButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonCam.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonCam.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonCam.widthAnchor.constraint(equalToConstant: 300),
            buttonCam.heightAnchor.constraint(equalToConstant: 30),
            
            backgroundSettings.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundSettings.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundSettings.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundSettings.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            scareFaceButton.widthAnchor.constraint(equalToConstant: 100),
            scareFaceButton.heightAnchor.constraint(equalToConstant: 100),
            scareFaceButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scareFaceButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupBackground(){
        self.addSubview(backgroundSettings)
    }
}

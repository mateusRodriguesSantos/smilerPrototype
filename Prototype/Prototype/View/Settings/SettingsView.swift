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
//    let buttonCam:UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = .blue
//        button.tintColor = .white
//        button.title(for: .normal)
//        button.setTitle("Camera", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    let backgroundSettings: UIImageView = {
        let background = UIImageView(image: UIImage(named: "background"))
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let cameraOptionBarButton: UIButton = {
        let optionBarButton = UIButton()
        optionBarButton.setImage(UIImage(named: "Camera"), for: .normal)
        optionBarButton.setTitle("Camera", for: .normal)
        optionBarButton.sizeToFit()
        optionBarButton.centerLabelVerticallyWithPadding(spacing: 0.5, alingment: 0)
        return optionBarButton
    }()
    
     lazy var cameraBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(customView: self.cameraOptionBarButton)
        return barButtonItem
    }()
    
    //Provisorio
    let happyFaceButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Happy"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.setTitle("Alegria", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.centerLabelVerticallyWithPadding(spacing: 150, alingment: 2)
        return button 
    }()
    
    let sadFaceButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Sad"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.setTitle("Tristeza", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.centerLabelVerticallyWithPadding(spacing: 150, alingment: 2)
        return button
    }()

    
    let scareFaceButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Scare"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.setTitle("Medo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.centerLabelVerticallyWithPadding(spacing: 150, alingment: 2)
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
//        self.addSubview(buttonCam)
        self.addSubview(happyFaceButton)
        self.addSubview(sadFaceButton)
        self.addSubview(scareFaceButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
//            buttonCam.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
//            buttonCam.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            buttonCam.widthAnchor.constraint(equalToConstant: 300),
//            buttonCam.heightAnchor.constraint(equalToConstant: 30),
            
            
            //Bacground Settings Constraints
            backgroundSettings.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundSettings.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundSettings.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundSettings.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            
            //Happy Face Button Constraints
            happyFaceButton.widthAnchor.constraint(equalToConstant: 80),
            happyFaceButton.heightAnchor.constraint(equalToConstant: 80),
            happyFaceButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            happyFaceButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200),
            
            //Sad Face Button Constraints
            sadFaceButton.widthAnchor.constraint(equalToConstant: 80),
            sadFaceButton.heightAnchor.constraint(equalToConstant: 80),
            sadFaceButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            sadFaceButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            
            //Scare Face Button Constraints
            scareFaceButton.widthAnchor.constraint(equalToConstant: 80),
            scareFaceButton.heightAnchor.constraint(equalToConstant: 80),
            scareFaceButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            scareFaceButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 200)
        ])
    }
    
    func setupBackground(){
        self.addSubview(backgroundSettings)
    }
}

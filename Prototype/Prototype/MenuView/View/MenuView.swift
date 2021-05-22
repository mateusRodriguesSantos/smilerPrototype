//
//  MenuView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 31/03/21.
//

import UIKit

class MenuView:UIView {

//    let setUpsView:UIStackView = {
//        let view = UIStackView(frame: .zero)
//        view.backgroundColor = .clear
//        view.alignment = .top
//        view.axis = .vertical
//        view.distribution = .equalSpacing
//        view.isUserInteractionEnabled = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    let shareLocationView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.borderWidth = 0.28
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mensagesView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Suplementary Views
    
    let setUpsViewLabel1:UILabel = {
        let colorBack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let label = UILabel(frame: .zero)
        label.text = "Meus Alertas"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = colorBack
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setUpsViewLabel2:UILabel = {
        let colorBack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let label = UILabel(frame: .zero)
        label.text = "Meus contatos"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.textColor = colorBack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setUpsViewButton1:UIButton = {
        let button = UIButton(frame: .zero)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Editar Alertas", for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.borderWidth = 0.28
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let setUpsViewButton2:UIButton = {
        let button = UIButton(frame: .zero)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Gatilhos de emergência", for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        button.layer.borderWidth = 0.28
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let textShareLocationView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Compartilhar Localização em tempo real"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchShareLocationView:UISwitch = {
        let switch_ = UISwitch(frame: .zero)
        switch_.isOn = true
        switch_.translatesAutoresizingMaskIntoConstraints = false
        return switch_
    }()
    
    let textMensagesView:UILabel = {
        let colorBack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let label = UILabel(frame: .zero)
        label.text = "Mensagem"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textFieldMensagesView:UITextView = {
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        let textView = UITextView(frame: .zero)
        textView.text = "Digite uma mensagem de emergência"
        textView.alpha = 0.2
        textView.textAlignment = .left
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        let colorBack = UIColor(red: 213/255.0, green: 212/255.0, blue: 220/255.0, alpha: 1.0)
        backgroundColor = colorBack
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuView:ViewCodable {
    func setupViewHierarchy() {
        //self.addSubview(setUpsView)
        self.addSubview(shareLocationView)
        self.addSubview(mensagesView)
        self.addSubview(setUpsViewLabel1)
        self.addSubview(setUpsViewButton1)
        self.addSubview(setUpsViewLabel2)
        self.addSubview(setUpsViewButton2)
        
        shareLocationView.addSubview(textShareLocationView)
        shareLocationView.addSubview(switchShareLocationView)
        
        mensagesView.addSubview(textMensagesView)
        mensagesView.addSubview(textFieldMensagesView)
    }
    
    func setupConstraints() {

    //        NSLayoutConstraint.activate([
    //            setUpsView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
    //            setUpsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
    //            setUpsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    //            setUpsView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor,constant: 20),
    //        ])

        NSLayoutConstraint.activate([
            setUpsViewLabel1.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            setUpsViewLabel1.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            setUpsViewLabel1.widthAnchor.constraint(equalTo: self.widthAnchor),
            setUpsViewLabel1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05),
        ])
        
        NSLayoutConstraint.activate([
            setUpsViewButton1.topAnchor.constraint(equalTo: self.setUpsViewLabel1.bottomAnchor),
            setUpsViewButton1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            setUpsViewButton1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            setUpsViewButton1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:  0.06),
        ])
        
        NSLayoutConstraint.activate([
            setUpsViewLabel2.topAnchor.constraint(equalTo: self.setUpsViewButton1.bottomAnchor),
            setUpsViewLabel2.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            setUpsViewLabel2.widthAnchor.constraint(equalTo: self.widthAnchor),
            setUpsViewLabel2.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:  0.05),
        ])
        
        NSLayoutConstraint.activate([
            setUpsViewButton2.topAnchor.constraint(equalTo: self.setUpsViewLabel2.bottomAnchor),
            setUpsViewButton2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            setUpsViewButton2.widthAnchor.constraint(equalTo: self.widthAnchor),
            setUpsViewButton2.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:  0.06),
        ])
        
        NSLayoutConstraint.activate([
            shareLocationView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07),
            shareLocationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shareLocationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shareLocationView.topAnchor.constraint(equalTo: self.setUpsViewButton2.bottomAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            mensagesView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            mensagesView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            mensagesView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            mensagesView.topAnchor.constraint(equalTo: self.shareLocationView.bottomAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            textShareLocationView.widthAnchor.constraint(equalTo: shareLocationView.widthAnchor, multiplier: 0.6),
            textShareLocationView.leadingAnchor.constraint(equalTo: shareLocationView.leadingAnchor,constant: 13),
            textShareLocationView.centerYAnchor.constraint(equalTo: shareLocationView.centerYAnchor),
        
        ])
        
        NSLayoutConstraint.activate([
            switchShareLocationView.trailingAnchor.constraint(equalTo: shareLocationView.trailingAnchor, constant: -20),
            switchShareLocationView.centerYAnchor.constraint(equalTo: shareLocationView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            textMensagesView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40),
            textMensagesView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            textMensagesView.leadingAnchor.constraint(equalTo: mensagesView.leadingAnchor,constant: 20),
            textMensagesView.topAnchor.constraint(equalTo: mensagesView.topAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            textFieldMensagesView.leadingAnchor.constraint(equalTo: mensagesView.leadingAnchor,constant: 20),
            textFieldMensagesView.trailingAnchor.constraint(equalTo: mensagesView.trailingAnchor,constant: -30),
            textFieldMensagesView.topAnchor.constraint(equalTo: textMensagesView.bottomAnchor, constant: 5),
            textFieldMensagesView.bottomAnchor.constraint(equalTo: mensagesView.bottomAnchor, constant: -5),
        ])
    }
}

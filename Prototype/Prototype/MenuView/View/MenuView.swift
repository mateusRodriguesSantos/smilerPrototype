//
//  MenuView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 31/03/21.
//

import UIKit

class MenuView:UIView {
    
    ///Acessory view of keyboards
    let viewAcessory = AcessoryViewKeyboard(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05))
    
    //MARK: Buttons
    
    let setUpsViewLabel1:UILabel = {
        let colorBack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let label = UILabel(frame: .zero)
        label.text = "Meus Alertas"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .white
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
        label.textColor = .white
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
    
    //MARK: LocationView share
    
    let shareLocationView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.borderWidth = 0.28
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textShareLocationView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Compartilhar Localização pelo SMS"
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
    
    //MARK: NameView
    
    let nameView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textNameView:UILabel = {
        let colorBack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let label = UILabel(frame: .zero)
        label.text = "Meu Nome"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTextView:UITextView = {
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        let textView = UITextView(frame: .zero)
        textView.text = "Seu nome"
        textView.alpha = 0.2
        textView.inputAccessoryView = viewAcessory
        textView.textAlignment = .left
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK: Number View
    
    let numberView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textNumberView:UILabel = {
        let colorBack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let label = UILabel(frame: .zero)
        label.text = "Meu número"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberViewTextView:UITextView = {
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        let textView = UITextView(frame: .zero)
        textView.text = "Seu número com DDD"
        textView.alpha = 0.2
        textView.keyboardType = .numberPad
        textView.inputAccessoryView = viewAcessory
        textView.textAlignment = .left
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK: MensagesView
    
    let mensagesView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    lazy var mensagesTextView:UITextView = {
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        let textView = UITextView(frame: .zero)
        textView.text = "Digite uma mensagem de emergência"
        textView.alpha = 0.2
        textView.inputAccessoryView = viewAcessory
        textView.textAlignment = .left
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        let colorBack = UIColor(red: 41/255.0, green: 42/255.0, blue: 48/255.0, alpha: 1.0)
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
        self.addSubview(numberView)
        self.addSubview(nameView)
        self.addSubview(mensagesView)
        self.addSubview(setUpsViewLabel1)
        self.addSubview(setUpsViewButton1)
        self.addSubview(setUpsViewLabel2)
        self.addSubview(setUpsViewButton2)
        
        shareLocationView.addSubview(textShareLocationView)
        shareLocationView.addSubview(switchShareLocationView)
        
        
        nameView.addSubview(textNameView)
        nameView.addSubview(nameTextView)
        
        
        numberView.addSubview(textNumberView)
        numberView.addSubview(numberViewTextView)
        
        mensagesView.addSubview(textMensagesView)
        mensagesView.addSubview(mensagesTextView)
    }
    
    func setupConstraints() {

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
            textShareLocationView.widthAnchor.constraint(equalTo: shareLocationView.widthAnchor, multiplier: 0.6),
            textShareLocationView.leadingAnchor.constraint(equalTo: shareLocationView.leadingAnchor,constant: 13),
            textShareLocationView.centerYAnchor.constraint(equalTo: shareLocationView.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            switchShareLocationView.trailingAnchor.constraint(equalTo: shareLocationView.trailingAnchor, constant: -20),
            switchShareLocationView.centerYAnchor.constraint(equalTo: shareLocationView.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            nameView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.12),
            nameView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            nameView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            nameView.topAnchor.constraint(equalTo: self.shareLocationView.bottomAnchor,constant: 20),
        ])

        let constraintTextNameViewLeading = textNameView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40)
        constraintTextNameViewLeading.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            constraintTextNameViewLeading,
            textNameView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            textNameView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor,constant: 20),
            textNameView.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            nameTextView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor,constant: 20),
            nameTextView.trailingAnchor.constraint(equalTo: nameView.trailingAnchor,constant: -30),
            nameTextView.topAnchor.constraint(equalTo: textNameView.bottomAnchor, constant: 5),
            nameTextView.bottomAnchor.constraint(equalTo: nameView.bottomAnchor, constant: -5),
        ])

        NSLayoutConstraint.activate([
            numberView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.12),
            numberView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            numberView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            numberView.topAnchor.constraint(equalTo: self.nameView.bottomAnchor,constant: 20),
        ])
        
        let constraintTextNumberViewLeading = textNumberView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40)
        constraintTextNumberViewLeading.priority = UILayoutPriority(999)

        NSLayoutConstraint.activate([
            constraintTextNumberViewLeading,
            textNumberView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            textNumberView.leadingAnchor.constraint(equalTo: numberView.leadingAnchor,constant: 20),
            textNumberView.topAnchor.constraint(equalTo: numberView.topAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            numberViewTextView.leadingAnchor.constraint(equalTo: numberView.leadingAnchor,constant: 20),
            numberViewTextView.trailingAnchor.constraint(equalTo: numberView.trailingAnchor,constant: -30),
            numberViewTextView.topAnchor.constraint(equalTo: textNumberView.bottomAnchor, constant: 5),
            numberViewTextView.bottomAnchor.constraint(equalTo: numberView.bottomAnchor, constant: -5),
        ])

        NSLayoutConstraint.activate([
            mensagesView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            mensagesView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            mensagesView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            mensagesView.topAnchor.constraint(equalTo: self.numberView.bottomAnchor,constant: 20),
        ])
        let constraintTextMensagesView = textMensagesView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40)
        constraintTextMensagesView.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            constraintTextMensagesView,
            textMensagesView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            textMensagesView.leadingAnchor.constraint(equalTo: mensagesView.leadingAnchor,constant: 20),
            textMensagesView.topAnchor.constraint(equalTo: mensagesView.topAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            mensagesTextView.leadingAnchor.constraint(equalTo: mensagesView.leadingAnchor,constant: 20),
            mensagesTextView.trailingAnchor.constraint(equalTo: mensagesView.trailingAnchor,constant: -30),
            mensagesTextView.topAnchor.constraint(equalTo: textMensagesView.bottomAnchor, constant: 5),
            mensagesTextView.bottomAnchor.constraint(equalTo: mensagesView.bottomAnchor, constant: -5),
        ])
    }
}

//
//  MenuView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 31/03/21.
//

import UIKit
import TinyConstraints
import NatDS

class MenuView:UIView {
    
    ///Acessory view of keyboards
    let viewAcessory = AcessoryViewKeyboard(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05))
    
    //NavigationBar
    public let navigationBar = AppNavigationBar(title: .text("Menu"), leftButton: .back)
    
    //MARK: Buttons
    
    let setUpsViewLabel1: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Meus Alertas"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .bold)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        return label
    }()
    
    let setUpsViewLabel2: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Meus Contatos"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .bold)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        return label
    }()
    
    let setUpsViewButton1: FeedbackButton = {
        let button = FeedbackButton(frame: .zero)
        button.visualFeedback = true
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: NatSpacing.tiny, bottom: 0, right: 0)
        button.cornerRadius = NatSizes.micro
        button.clipsToBounds = true
        button.backgroundColor = NatColors.surface
        button.setTitleColor(NatColors.highEmphasis, for: .normal)
        button.setTitle("Editar Alertas", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = NatFonts.fontRoboto(ofSize: .heading6, withWeight: .regular)
        return button
    }()
    
    let setUpsViewButton2: FeedbackButton = {
        let button = FeedbackButton(frame: .zero)
        button.visualFeedback = true
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: NatSpacing.tiny, bottom: 0, right: 0)
        button.cornerRadius = NatSizes.micro
        button.clipsToBounds = true
        button.backgroundColor = NatColors.surface
        button.setTitleColor(NatColors.highEmphasis, for: .normal)
        button.setTitle("Contatos de Emergência", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = NatFonts.fontRoboto(ofSize: .heading6, withWeight: .regular)
        return button
    }()
    
    //MARK: -LocationView share
    let setUpsViewLabel3: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Localização via SMS"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .bold)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        return label
    }()
    
    let shareLocationView: UIView = {
        let view = UIView(frame: .zero)
        view.cornerRadius = NatSizes.micro
        view.clipsToBounds = true
        view.backgroundColor = NatColors.surface
        return view
    }()
    
    let textShareLocationView: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Permitir Localização"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .heading6, withWeight: .regular)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchShareLocationView:UISwitch = {
        let switch_ = UISwitch(frame: .zero)
        switch_.isOn = true
        switch_.translatesAutoresizingMaskIntoConstraints = false
        return switch_
    }()
    
    //MARK: -NameView
    
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
    
    //MARK: -Number View
    
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
    
    //MARK: -MensagesView
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
        self.addSubview(navigationBar)
        //self.addSubview(setUpsView)
        self.addSubview(shareLocationView)
        self.addSubview(numberView)
        self.addSubview(nameView)
        self.addSubview(mensagesView)
        self.addSubview(setUpsViewLabel1)
        self.addSubview(setUpsViewButton1)
        self.addSubview(setUpsViewLabel2)
        self.addSubview(setUpsViewButton2)
        self.addSubview(setUpsViewLabel3)
        
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
        
        setUpsViewLabel1.topToBottom(of: navigationBar)
        setUpsViewLabel1.leadingToSuperview(offset: NatSpacing.small)
        setUpsViewLabel1.trailingToSuperview(offset: NatSpacing.small)
        setUpsViewLabel1.height(NatSizes.semiX)
        
        setUpsViewButton1.topToBottom(of: setUpsViewLabel1)
        setUpsViewButton1.leadingToSuperview(offset: NatSpacing.small)
        setUpsViewButton1.trailingToSuperview(offset: NatSpacing.small)
        setUpsViewButton1.height(NatSizes.medium)
        
        setUpsViewLabel2.topToBottom(of: setUpsViewButton1)
        setUpsViewLabel2.leadingToSuperview(offset: NatSpacing.small)
        setUpsViewLabel2.trailingToSuperview(offset: NatSpacing.small)
        setUpsViewLabel2.height(NatSizes.semiX)
        
        setUpsViewButton2.topToBottom(of: setUpsViewLabel2)
        setUpsViewButton2.leadingToSuperview(offset: NatSpacing.small)
        setUpsViewButton2.trailingToSuperview(offset: NatSpacing.small)
        setUpsViewButton2.height(NatSizes.medium)
        
        setUpsViewLabel3.topToBottom(of: setUpsViewButton2)
        setUpsViewLabel3.leadingToSuperview(offset: NatSpacing.small)
        setUpsViewLabel3.trailingToSuperview(offset: NatSpacing.small)
        setUpsViewLabel3.height(NatSizes.semiX)
        
        shareLocationView.topToBottom(of: setUpsViewLabel3)
        shareLocationView.leadingToSuperview(offset: NatSpacing.small)
        shareLocationView.trailingToSuperview(offset: NatSpacing.small)
        shareLocationView.height(NatSizes.medium)

        textShareLocationView.centerYToSuperview()
        textShareLocationView.leadingToSuperview(offset: NatSpacing.tiny)

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
    
    func setupAditionalConfiguration() {
        self.backgroundColor = NatColors.background
    }
}

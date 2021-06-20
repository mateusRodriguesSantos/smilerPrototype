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
        label.translatesAutoresizingMaskIntoConstraints = false
      
        label.textColor = NatColors.highEmphasis
        return label
    }()
    
    let setUpsViewLabel2: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Meus Contatos"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

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
        return label
    }()
    
    let switchShareLocationView: UISwitch = {
        let switchButton = UISwitch(frame: .zero)
        switchButton.isOn = true
        return switchButton
    }()
    
    //MARK: -NameView
    let nameView: NatCard = {
        let view = NatCard()
        view.configure(borderRadius: true)
        view.configure(elevation: true)
        return view
    }()
    
    let textNameView: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Meu Nome"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .regular)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var nameTextView:UITextView = {
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        let textView = UITextView(frame: .zero)
        textView.inputAccessoryView = viewAcessory
        textView.textColor = NatColors.mediumEmphasis
        textView.alpha = 0.5
        textView.font = NatFonts.fontRoboto(ofSize: .body2, withWeight: .regular)
        textView.textAlignment = .left
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK: -Number View
    let numberView: NatCard = {
        let view = NatCard()
        view.configure(borderRadius: true)
        view.configure(elevation: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textNumberView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Meu Número"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .regular)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        label.backgroundColor = .clear
        return label
    }()
    
  
    lazy var numberViewTextView:UITextView = {
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        let textView = UITextView(frame: .zero)
        textView.inputAccessoryView = viewAcessory
        textView.keyboardType = .numberPad
        textView.textColor = NatColors.mediumEmphasis
        textView.alpha = 0.5
        textView.font = NatFonts.fontRoboto(ofSize: .body2, withWeight: .regular)
        textView.textAlignment = .left
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK: -MensagesView
    let mensagesView: NatCard = {
        let view = NatCard()
        view.configure(borderRadius: true)
        view.configure(elevation: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textMensagesView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Mensagem"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .regular)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        label.backgroundColor = .clear
        return label
    }()
    

    lazy var mensagesTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.inputAccessoryView = viewAcessory
        textView.textColor = NatColors.mediumEmphasis
        textView.alpha = 0.5
        textView.font = NatFonts.fontRoboto(ofSize: .body2, withWeight: .regular)
        textView.textAlignment = .left
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
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

        switchShareLocationView.centerYToSuperview()
        switchShareLocationView.trailingToSuperview(offset: NatSpacing.tiny)

        nameView.topToBottom(of: textShareLocationView, offset: NatSpacing.semi)
        nameView.leadingToSuperview(offset: NatSpacing.small)
        nameView.trailingToSuperview(offset: NatSpacing.small)
        nameView.height(NatSizes.large)

        textNameView.topToSuperview(offset: NatSpacing.tiny)
        textNameView.leadingToSuperview(offset: NatSpacing.small)
        textNameView.centerXToSuperview()

        NSLayoutConstraint.activate([
            nameTextView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor,constant: 20),
            nameTextView.trailingAnchor.constraint(equalTo: nameView.trailingAnchor,constant: -30),
            nameTextView.topAnchor.constraint(equalTo: textNameView.bottomAnchor, constant: 5),
            nameTextView.bottomAnchor.constraint(equalTo: nameView.bottomAnchor, constant: -5),
        ])

        numberView.topToBottom(of: nameView, offset: NatSpacing.standard)
        numberView.leadingToSuperview(offset: NatSpacing.small)
        numberView.trailingToSuperview(offset: NatSpacing.small)
        numberView.height(NatSizes.large)

        textNumberView.topToSuperview(offset: NatSpacing.tiny)
        textNumberView.leadingToSuperview(offset: NatSpacing.small)
        textNumberView.centerXToSuperview()

        NSLayoutConstraint.activate([
            numberViewTextView.leadingAnchor.constraint(equalTo: numberView.leadingAnchor,constant: 20),
            numberViewTextView.trailingAnchor.constraint(equalTo: numberView.trailingAnchor,constant: -30),
            numberViewTextView.topAnchor.constraint(equalTo: textNumberView.bottomAnchor, constant: 5),
            numberViewTextView.bottomAnchor.constraint(equalTo: numberView.bottomAnchor, constant: -5),
        ])

        mensagesView.topToBottom(of: numberView, offset: NatSpacing.semi)
        mensagesView.leadingToSuperview(offset: NatSpacing.small)
        mensagesView.trailingToSuperview(offset: NatSpacing.small)
        mensagesView.bottomToSuperview(offset: -NatSpacing.standard)
        
        textMensagesView.topToSuperview(offset: NatSpacing.tiny)
        textMensagesView.leadingToSuperview(offset: NatSpacing.small)
        textMensagesView.centerXToSuperview()

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

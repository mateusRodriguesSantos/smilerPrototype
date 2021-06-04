//
//  AcessoryViewKeyboard.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 25/05/21.
//

import UIKit

protocol DelegateEndEditionKeyboard:AnyObject {
    func endEditionKeyboard()
}


class AcessoryViewKeyboard:UIView{
    
    weak var delegateEndEditionKeyboard:DelegateEndEditionKeyboard?
    
    let okButton:UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("OK", for: .normal)
        button.tintColor = .white
        button.contentHorizontalAlignment = .trailing
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(okButton)
        addConstraints()
        addTriggers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Triggers
extension AcessoryViewKeyboard{
    func addTriggers(){
         okButton.addTarget(self, action: #selector(self.okButtonAction), for: .touchUpInside)
    }
}

//MARK: Actions
extension AcessoryViewKeyboard{
    @objc func okButtonAction(){
        self.delegateEndEditionKeyboard?.endEditionKeyboard()
    }
}


extension AcessoryViewKeyboard{
    func addConstraints(){
        NSLayoutConstraint.activate([
            okButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            okButton.heightAnchor.constraint(equalTo: self.heightAnchor),
            okButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            okButton.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
}

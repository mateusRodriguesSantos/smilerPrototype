//
//  ContactsManagerView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit
import NatDS
import NatDSIcons
import TinyConstraints

class ContactsManagerView: UIView {

    //NavigationBar
    public let navigationBar = AppNavigationBar(title: .text("Contatos"), leftButton: .back)
    
    //Header
    private let header: UIView = {
        let view = UIView()
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ContactsManagerView:ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(navigationBar)
        self.addSubview(header)
    }
    
    func setupConstraints() {
//        header.topToBottom(of: navigationBar)
//        header.leadingToSuperview()
//        header.trailingToSuperview()
//        header.height(NatSizes.semiX) //height: 40
    }
    
    func setupAditionalConfiguration() {
        self.backgroundColor = NatColors.background
    }
}

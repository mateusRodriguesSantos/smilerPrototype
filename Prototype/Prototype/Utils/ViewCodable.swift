//
//  ViewCodable.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import Foundation

protocol ViewCodable {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
}

extension ViewCodable {
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
    
    func setupAditionalConfiguration() { }
}

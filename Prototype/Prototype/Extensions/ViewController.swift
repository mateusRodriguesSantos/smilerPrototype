//
//  ViewController.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 24/05/21.
//

import UIKit

extension UIViewController{
    static func alertFactory(_ title:String,_ menssage:String,_ owner:UIViewController){
        let alert = UIAlertController(title: title, message: menssage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alertAction in
            
        }))
        owner.present(alert, animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController{
    
    weak var coordinator:MainCoordinator?
    
    let baseView = CameraView()
    
    
    ///CamViewController ViewModel
    lazy var camera:Camera = {
        let cam = Camera()
        cam.delegateCamera = self
        return cam
    }()
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension CameraViewController:CameraDelegate{
    func setOwner(_ previewLayer: CALayer) {
        self.view.layer.insertSublayer(previewLayer, at: 1)
    }
    
    func setDelegate() -> AVCaptureVideoDataOutputSampleBufferDelegate {
        return self
    }
}

extension CameraViewController:AVCaptureVideoDataOutputSampleBufferDelegate{
    
}


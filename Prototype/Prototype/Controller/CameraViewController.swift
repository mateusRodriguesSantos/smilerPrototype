//
//  ViewController.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit
import Foundation
import Vision
import AVFoundation

class CameraViewController: UIViewController{
    
    weak var coordinator:MainCoordinator?
    
    let baseView = CameraView()
    
    var isCallEnabled:Bool = false
    
    var numberCall = Int()
    
    var expressionInDetection:[facialExpressions] = [.smile]
    
    lazy var camera:Camera = {
        let cam = Camera()
        cam.delegateCamera = self
        return cam
    }()
    
    lazy var faceDetection:FaceDetection = {
        let faceDetection = FaceDetection(faceView: baseView.faceView, previewLayer: camera.captureVideoPreviewLayer, expressionDetecting: expressionInDetection)
        faceDetection.delegate = self
        return faceDetection
    }()
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addTriggers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        camera.prepareCamera(isCustomSize: false)
    }
}

extension CameraViewController:CameraDelegate{
    func setOwner(_ previewLayer: CALayer) {
        self.baseView.layer.insertSublayer(previewLayer, at: 0)
    }
    
    func setDelegate() -> AVCaptureVideoDataOutputSampleBufferDelegate {
        return self
    }
}

// MARK: - Triggers
extension CameraViewController{
    func addTriggers() {
        self.baseView.buttonRegister.addTarget(self, action: #selector(self.actionButtonCamera(_:)), for: .touchUpInside)
    }
    
    @objc func actionButtonCamera(_ sender: Any) {
        
        faceDetection.faceView?.registerNeutralOuterLips()
    }
}

extension CameraViewController:AVCaptureVideoDataOutputSampleBufferDelegate{
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        

        // 1 - Get the image buffer from the passed in sample buffer.
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
                
        // 2 - Get the image buffer from the passed in sample buffer.
        let detectFaceRequest = VNDetectFaceLandmarksRequest(completionHandler: self.faceDetection.detectedFace)
        
        // 3 - Use your previously defined sequence request handler to perform your face detection request on the image. The orientation parameter tells the request handler what the orientation of the input image is.
        do {
            try self.faceDetection.sequenceHandler.perform(
                [detectFaceRequest],
                on: imageBuffer,
                orientation: .leftMirrored)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func call(){
        if let url = URL(string: "tel://+55\(numberCall)"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: {_ in
//                self.isCallEnabled = false
            })
        }
    }
}

extension CameraViewController:FaceExpressionDelegate{
    func sadnessDetected(_ sadness: Bool) {
        if sadness{
            if isCallEnabled == false{
                call()
            }
            isCallEnabled = true
            baseView.imageSadness.isHidden = false
        }else{
            baseView.imageSadness.isHidden = true
        }
    }
    
    func fearDetected(_ fear: Bool) {
        if fear{
            if isCallEnabled == false{
                call()
            }
            isCallEnabled = true
            baseView.imageFear.isHidden = false
        }else{
            baseView.imageFear.isHidden = true
        }
    }
    

    func faceDetectedAction(_ boundingBox: CGRect) {
        DispatchQueue.main.async {
            if boundingBox == .zero{
                self.baseView.imageSmile.isHidden = true
                self.baseView.imageFear.isHidden = true
                self.baseView.imageSadness.isHidden = true
                
                self.baseView.viewLeft.backgroundColor = .red
                self.baseView.viewRight.backgroundColor = .red
                self.baseView.labelCamera.text = "Tente Manter o quadrado do rosto tocando as duas áreas vermelhas"
            }else{
                self.baseView.viewLeft.backgroundColor = .red
                self.baseView.viewRight.backgroundColor = .red
                self.baseView.labelCamera.text = "Tente Manter o quadrado do rosto tocando as duas áreas vermelhas"
                
                if boundingBox.intersects(self.baseView.viewLeft.bounds){
                    self.baseView.viewLeft.backgroundColor = .green
                    self.baseView.labelCamera.text = "Mantenha seu rosto perpendicular aos quadrados"
                }
                if boundingBox.intersects(self.baseView.viewRight.bounds){
                    self.baseView.viewRight.backgroundColor = .green
                    self.baseView.labelCamera.text = "Mantenha seu rosto perpendicular aos quadrados"
                }
            }
        }
    }
    
    
    func smileDetected(_ faceDetected: Bool) {
        if faceDetected{
            if isCallEnabled == false{
                call()
            }
            isCallEnabled = true
            baseView.imageSmile.isHidden = false
        }else{
            baseView.imageSmile.isHidden = true
        }
    }
    
}

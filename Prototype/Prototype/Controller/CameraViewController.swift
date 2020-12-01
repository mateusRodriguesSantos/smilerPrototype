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
    
    lazy var camera:Camera = {
        let cam = Camera()
        cam.delegateCamera = self
        return cam
    }()
    
    lazy var faceDetection:FaceDetection = {
        let faceDetection = FaceDetection(faceView: baseView.faceView, previewLayer: camera.captureVideoPreviewLayer)
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
        if let url = URL(string: "tel://+556133992954"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension CameraViewController:FaceExpressionDelegate{
    func faceDetectedAction(_ boundingBox: CGRect) {
        
    }
    
    
    func smileDetected(_ faceDetected: Bool) {
        if faceDetected{
//            call()
            baseView.labelCamera.isHidden = false
        }else{
            baseView.labelCamera.isHidden = true
        }

    }
    
    func sadnessDetected() {
        
    }
}

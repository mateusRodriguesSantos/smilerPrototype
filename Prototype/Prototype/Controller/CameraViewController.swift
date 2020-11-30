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
    
    var sequenceHandler = VNSequenceRequestHandler()
    
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

extension CameraViewController:AVCaptureVideoDataOutputSampleBufferDelegate{
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        // 1 - Get the image buffer from the passed in sample buffer.
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        // 2 - Get the image buffer from the passed in sample buffer.
        let detectFaceRequest = VNDetectFaceLandmarksRequest(completionHandler: detectedFace)
        
        // 3 - Use your previously defined sequence request handler to perform your face detection request on the image. The orientation parameter tells the request handler what the orientation of the input image is.
        do {
            try sequenceHandler.perform(
                [detectFaceRequest],
                on: imageBuffer,
                orientation: .leftMirrored)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func detectedFace(request: VNRequest, error: Error?) {
        
        // 1 - Extract the first result from the array of face observation results.
        guard
            let results = request.results as? [VNFaceObservation],
            let result = results.first
        else {
            // 2 - Clear the FaceView if something goes wrong or no face is detected.
            baseView.faceView.clear()
            return
        }
        
        // 3 - Set the bounding box to draw in the FaceView after converting it from the coordinates in the VNFaceObservation.
        //      let box = result.boundingBox
        //        baseView.faceView.boundingBox = convert(rect: box)
        
        updateFaceView(for: result)
        
        // 4 - Call setNeedsDisplay() to make sure the FaceView is redrawn.
        DispatchQueue.main.async {
            self.baseView.faceView.setNeedsDisplay()
        }
    }
    
    func convert(rect: CGRect) -> CGRect {
        let newRect = camera.captureVideoPreviewLayer.layerRectConverted(fromMetadataOutputRect: rect)
        return newRect
    }
    
    // 1
    func landmark(point: CGPoint, to rect: CGRect) -> CGPoint {
        // 2
        let absolute = point.absolutePoint(in: rect)
        
        // 3
        let converted = camera.captureVideoPreviewLayer.layerPointConverted(fromCaptureDevicePoint: absolute)
        
        // 4
        return converted
    }
    
    func landmark(points: [CGPoint]?, to rect: CGRect) -> [CGPoint]? {
        return points?.compactMap { landmark(point: $0, to: rect) }
    }
    
    func updateFaceView(for result: VNFaceObservation) {
        defer {
            DispatchQueue.main.async {
                self.baseView.faceView.setNeedsDisplay()
            }
        }
        
        let box = result.boundingBox
        baseView.faceView.boundingBox = convert(rect: box)
        
        guard let landmarks = result.landmarks else {
            return
        }
        
        if let leftEye = landmark(
            points: landmarks.leftEye?.normalizedPoints,
            to: result.boundingBox) {
            baseView.faceView.leftEye = leftEye
        }
        
        if let rightEye = landmark(
            points: landmarks.rightEye?.normalizedPoints,
            to: result.boundingBox) {
            baseView.faceView.rightEye = rightEye
        }
        
        if let leftEyebrow = landmark(
            points: landmarks.leftEyebrow?.normalizedPoints,
            to: result.boundingBox) {
            baseView.faceView.leftEyebrow = leftEyebrow
        }
       
        if let rightEyebrow = landmark(
            points: landmarks.rightEyebrow?.normalizedPoints,
            to: result.boundingBox) {
            baseView.faceView.rightEyebrow = rightEyebrow
        }
        
        if let nose = landmark(
          points: landmarks.nose?.normalizedPoints,
          to: result.boundingBox) {
            baseView.faceView.nose = nose
        }

        if let outerLips = landmark(
          points: landmarks.outerLips?.normalizedPoints,
          to: result.boundingBox) {
            baseView.faceView.outerLips = outerLips
        }

        if let innerLips = landmark(
          points: landmarks.innerLips?.normalizedPoints,
          to: result.boundingBox) {
            baseView.faceView.innerLips = innerLips
        }

        if let faceContour = landmark(
          points: landmarks.faceContour?.normalizedPoints,
          to: result.boundingBox) {
            baseView.faceView.faceContour = faceContour
        }
    }
}


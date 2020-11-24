//
//  Cam.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 01/09/20.
//  Copyright © 2020 Mateus Rodrigues Santos. All rights reserved.
//

import AVFoundation
import UIKit

/**
How to use this:
 1 - Instanciate the Camera;
 2 - Add protocol in your ViewController;
*/

protocol CameraDelegate: class {
    /**
    This function returns the view controller owner of this camera
     - Authors: Mateus R.
     - Returns: CamViewController
     - Parameter previewLayer: previewLayer
     - Parameter viewCamera: previewLayer
     */
    func setOwner(_ previewLayer:CALayer)
    /**
    This function set the delegate for the camera
     - Authors: Mateus R.
     - Returns: AVCaptureVideoDataOutputSampleBufferDelegate
     - Parameters: nothing
     */
    func setDelegate() -> AVCaptureVideoDataOutputSampleBufferDelegate
}

class Camera{
    
    // MARK: Delegate For Owner
        
    weak var delegateCamera:CameraDelegate?
    
    //MARK: AVFoundation Properties
    
    ///Layer of camera view
    private var previewLayer: CALayer!

    ///Position back or front
    var positionDevice:AVCaptureDevice.Position = AVCaptureDevice.Position.front
    
    ///Selecting the capture session this is responsable for all gerency of the input and output devices and media captures
    private let captureSession = AVCaptureSession()
    
    ///Device
    var captureDevice:AVCaptureDevice!
    
    //A custom size for captureVideoPreviewLayer
    var customSizeVideoPreviewLayer:CGRect!
    
    /// Layer that show video in real time
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    ///Photo Output for capture and settings of the propertys of the camera
    let photoOutput = AVCapturePhotoOutput()
}

//MARK: Configuration camera
extension Camera{
    /**
    This function prepare the device for use as camera
     - Authors: Mateus R.
     - Returns: nothing
     - Parameters: nothing
     */
    func prepareCamera(isCustomSize: Bool){
        //search devices availables
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: positionDevice).devices
        
        //Choose the first device in matrix
        captureDevice = availableDevices.first
        
        beginSession(isCustomSize: isCustomSize)
    }
    
    
    /**
     This method set up the inputs, outputs, quality image and others configurations
     - Authors: Mateus R.
     - Returns: nothing
     - Parameters: nothing
     */
    private func beginSession(isCustomSize: Bool){
            //Set up focus
            setUpFocus()
            
            //Set up preview layer
            setUpPreviewLayer(isCustomSize: isCustomSize)
        
            //Start video capture
            captureSession.startRunning()
            
            //Configure outputs
            setUpOutputs()
    }
}

//MARK: Set ups camera
private extension Camera{
    
    /**
     This method set up the focus
     - Authors: Mateus R.
     - Returns: nothing
     - Parameters: nothing
     */
    private func setUpFocus() {
        do{
            if captureDevice.isFocusModeSupported(.continuousAutoFocus){
                do{
                    try captureDevice.lockForConfiguration()
                    captureDevice.focusMode = .continuousAutoFocus
                    captureDevice.unlockForConfiguration()
                }catch{
                    fatalError("Error in focus set up")
                }
                
            }else if captureDevice.isFocusModeSupported(.autoFocus){
                do{
                    try captureDevice.lockForConfiguration()
                    captureDevice.focusMode = .autoFocus
                    captureDevice.unlockForConfiguration()
                }catch{
                    fatalError("Error in focus set up")
                }
            }
            
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession.addInput(captureDeviceInput)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    /**
     This method set up the outputs
     - Authors: Mateus R.
     - Returns: nothing
     - Parameters: nothing
     */
    private func setUpOutputs(){
        
        //FOR CAPTURE OUTPUT FUNCTION
        //The data output is responsable at set an image
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as String):NSNumber(value: kCVPixelFormatType_32BGRA)]
        
        //Discard frames video that arrive late
        dataOutput.alwaysDiscardsLateVideoFrames = true
        
        if captureSession.canAddOutput(dataOutput){
            captureSession.addOutput(dataOutput)
        }
        
        //FOR PHOTO OUTPUT FUNCTION
        //Configuring others outputs of camera
        captureSession.sessionPreset = .photo
        //Add data output in capture session
        if captureSession.canAddOutput(photoOutput){
            photoOutput.isHighResolutionCaptureEnabled = true
            captureSession.addOutput(photoOutput)
        }
    
        
        //Others configurations
        
        //Set up camera orientation
        let videoConnection = dataOutput.connection(with: .video)
        videoConnection?.videoOrientation = .portrait
        
        //Commit configuration of captureSession
        captureSession.commitConfiguration()
        
        //Create a queue for buffer delegate of dataOutput
        let queue = DispatchQueue(label: "can.brianAndCapture.captureQueue")
        //Setting the buffer delegate, delegate is this view controller
        let delegate = delegateCamera?.setDelegate()
        dataOutput.setSampleBufferDelegate(delegate, queue: queue)
    }
    
    /**
     This method set up preview layer
     - Authors: Mateus R.
     - Returns: nothing
     - Parameters: nothing
     */
    private func setUpPreviewLayer(isCustomSize:Bool){
        
        self.captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.captureVideoPreviewLayer.videoGravity = .resizeAspectFill
        
        //Menor preview Layer set up
        if isCustomSize == true{
            //Set up frame of captureVideoPreviewLayer
            self.captureVideoPreviewLayer.frame = self.customSizeVideoPreviewLayer
            
            //Initialise menorPreviewLayerView
            self.previewLayer = self.captureVideoPreviewLayer
            
            delegateCamera?.setOwner(self.previewLayer)
        }else{

            //Set up frame of captureVideoPreviewLayer
            self.captureVideoPreviewLayer.frame = UIScreen.main.bounds
            //Change preview layer
            self.previewLayer = self.captureVideoPreviewLayer
   
            delegateCamera?.setOwner(self.previewLayer)
        }
        
    }
}

//MARK: Camera behaviors
extension Camera{

    /**
     Stop session and remove all input devices
     - Authors: Mateus R.
     - Returns: nothing
     - Parameters: nothing
     */
    func stopCaptureSession(){
        self.captureSession.stopRunning()
        
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput]{
            for input in inputs{
                captureSession.removeInput(input)
            }
        }
    }
    
    /**
     Gets image
     - Authors: Mateus R
     - Returns: UIImage for use in app or archievement
     - Parameter imageData:Data
     */
    func getImageFromPhotoOutput(_ imageData:Data) -> UIImage?{
        
        
        // Check if UIImage could be initialized with image data
        guard let capturedImage = UIImage.init(data: imageData , scale: 1.0) else {
            print("Fail to convert image data to UIImage")
            return nil
        }
        
        // Get original image width/height
        let imgWidth = capturedImage.size.width
        let imgHeight = capturedImage.size.height
        // Get origin of cropped image
        let imgOrigin = CGPoint(x: (imgWidth - imgHeight)/2, y: (imgHeight - imgHeight)/2)
        // Get size of cropped iamge
        let imgSize = CGSize(width: imgHeight, height: imgHeight)
        
        // Check if image could be cropped successfully
        guard let imageRef = capturedImage.cgImage?.cropping(to: CGRect(origin: imgOrigin, size: imgSize)) else {
            print("Fail to crop image")
            return nil
        }
        
        let imageToSave = UIImage(cgImage: imageRef, scale: 1.0, orientation: .right)
        
        return imageToSave
        
    }
    
    /**
     Gets image 2
     - Authors: Mateus R
     - Returns: UIImage for use in app or archievement
     - Parameter buffer:CMSampleBuffer
     */
    func getImageFromSampleBuffer(buffer:CMSampleBuffer) -> UIImage?{
        
        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer){
            let cImage = CIImage(cvPixelBuffer: pixelBuffer)
            let context = CIContext()
            
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
            
            if let imageRect = context.createCGImage(cImage, from: imageRect){
     
                return UIImage(cgImage: imageRect, scale: UIScreen.main.scale, orientation: .up)
            }
        }
        return nil
    }
    
    /**
     Active the flash cam
     - Authors: Mateus R.
     - Returns: A AVCapturePhotoSettings object that contains the settings to get photo with photoOutput
     - Parameters: nothing
     */
    func activeFlash() -> AVCapturePhotoSettings{
        let flashModeAvailable:AVCaptureDevice.FlashMode = .on
        let settings = AVCapturePhotoSettings()
        
        if captureDevice.hasFlash{
            settings.flashMode = flashModeAvailable
            return settings
        }else{
            return settings
        }
    }
}

//MARK: Additional functions
extension Camera{
    
    /**
     This method detect a face in an image
     - Authors: Mateus R
     - Returns: nothing
     - Parameter image:UIIMage?
     */
    public func smileDetector(image:UIImage?) {
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        
        let faces = detector?.features(in: CIImage(image: image!)!, options: [CIDetectorSmile: true]) as? [CIFaceFeature]
        
        
        print("features: \(String(describing: faces?.first?.hasSmile))")
        
    }
    
    /**
     This method use models for classify to the images
     - Authors: Cristiano P.
     - Returns: nothing
     - Parameters: image for classify
     */
    func classifiedFace(imagem:UIImage?) {
        UIGraphicsBeginImageContextWithOptions (CGSize(width: 299, height: 299), true, 2.0)
        
        imagem!.draw(in: CGRect(x: 0, y: 0, width: 299, height: 299))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         Int(newImage.size.width), Int(newImage.size.height),
                                         kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        
        guard (status == kCVReturnSuccess) else {
            return
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        
        let context = CGContext(data: pixelData, width: Int(newImage.size.width), height: Int(newImage.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace,bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: newImage.size.height)
        
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        
        newImage.draw(in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height))
        
        UIGraphicsPopContext()
        
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        
        
        // MARK: Prediction da imagem / classificacao
        //predict image label
        //        classificacao.isHidden = false
        //                guard let prediction = try? visionModel.prediction(image: pixelBuffer!) else {
        //                    print("Can't Predict!")
        //                    return
        //                }
        
        //        classificacao.text = "This is probably \(prediction.classLabel)."
        DispatchQueue.main.async {
            //            self.resultLabel.isHidden = false
            //            self.resultLabel.text = "\(prediction.classLabel)"
        }
        //                 print("This is probably \(prediction.classLabel).")
        
    }
}


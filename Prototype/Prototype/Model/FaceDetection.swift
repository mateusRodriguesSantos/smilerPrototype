//
//  FaceDetection.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 30/11/20.
//

/*
 
Todas as APIs da estrutura Vision usam três construções:

Solicitação: a solicitação define o tipo de coisa que você deseja detectar e um manipulador de conclusão que processará os resultados. Esta é uma subclasse de VNRequest.
Manipulador de solicitação: o manipulador de solicitação executa a solicitação no buffer de pixel fornecido (pense: imagem). Isso será VNImageRequestHandlerpara uma única detecção única ou VNSequenceRequestHandlerpara processar uma série de imagens.
Resultados: os resultados serão anexados à solicitação original e passados ​​para o manipulador de conclusão definido ao criar a solicitação. Eles são subclasses deVNObservation
*/

import AVFoundation
import Vision

protocol FaceExpressionDelegate:class {
    func smileDetected(_ faceDetected:Bool)
    func sadnessDetected()
}

class FaceDetection{
    
    var face:Bool = false
    
    weak var delegate:FaceExpressionDelegate?
    weak var faceView:FaceView?
    weak var previewLayer:AVCaptureVideoPreviewLayer?
    var sequenceHandler = VNSequenceRequestHandler()
    
    init(faceView:FaceView,previewLayer:AVCaptureVideoPreviewLayer) {
        self.faceView = faceView
        self.previewLayer = previewLayer
    }
    
    func detectedFace(request: VNRequest, error: Error?) {
        
        // 1 - Extract the first result from the array of face observation results.
        guard
            let results = request.results as? [VNFaceObservation],
            let result = results.first
        else {
            // 2 - Clear the FaceView if something goes wrong or no face is detected.
            
            faceView?.clear()
            return
        }
        
        // 3 - Set the bounding box to draw in the FaceView after converting it from the coordinates in the VNFaceObservation.
        //      let box = result.boundingBox
        //        baseView.faceView.boundingBox = convert(rect: box)
        
        updateFaceView(for: result)
        
        // 4 - Call setNeedsDisplay() to make sure the FaceView is redrawn.
        DispatchQueue.main.async { [weak self] in
            self?.faceView?.setNeedsDisplay()
        }
    }
    
    func convert(rect: CGRect) -> CGRect {
        guard let newRect = previewLayer?.layerRectConverted(fromMetadataOutputRect: rect) else{
            return .zero
        }
        return newRect
    }
    
    // 1
    func landmark(point: CGPoint, to rect: CGRect) -> CGPoint {
        // 2
        let absolute = point.absolutePoint(in: rect)
        
        // 3
        guard let converted = previewLayer?.layerPointConverted(fromCaptureDevicePoint: absolute) else{
            return .zero
        }
        
        // 4
        return converted
    }
    
    func landmark(points: [CGPoint]?, to rect: CGRect) -> [CGPoint]? {
        return points?.compactMap { landmark(point: $0, to: rect) }
    }
    
    func updateFaceView(for result: VNFaceObservation) {
        defer {
            DispatchQueue.main.async { [weak self] in
                self?.faceView?.setNeedsDisplay()
            }
        }
        
        let box = result.boundingBox
        faceView?.boundingBox = convert(rect: box)
        
        guard let landmarks = result.landmarks else {
            return
        }
        
        if let leftEye = landmark(
            points: landmarks.leftEye?.normalizedPoints,
            to: result.boundingBox) {
            faceView?.leftEye = leftEye
        }
        
        if let rightEye = landmark(
            points: landmarks.rightEye?.normalizedPoints,
            to: result.boundingBox) {
            faceView?.rightEye = rightEye
        }
        
        if let leftEyebrow = landmark(
            points: landmarks.leftEyebrow?.normalizedPoints,
            to: result.boundingBox) {
            faceView?.leftEyebrow = leftEyebrow
        }
       
        if let rightEyebrow = landmark(
            points: landmarks.rightEyebrow?.normalizedPoints,
            to: result.boundingBox) {
            faceView?.rightEyebrow = rightEyebrow
        }
        
        if let nose = landmark(
          points: landmarks.nose?.normalizedPoints,
          to: result.boundingBox) {
            faceView?.nose = nose
        }

        if let outerLips = landmark(
          points: landmarks.outerLips?.normalizedPoints,
          to: result.boundingBox) {
            faceView?.outerLips = outerLips
            DispatchQueue.main.async { [weak self] in
                self?.detectSmile(outerLips,yal: result.yaw!)
            }
        }

        if let innerLips = landmark(
          points: landmarks.innerLips?.normalizedPoints,
          to: result.boundingBox) {
            faceView?.innerLips = innerLips
        }

        if let faceContour = landmark(
          points: landmarks.faceContour?.normalizedPoints,
          to: result.boundingBox) {
            faceView?.faceContour = faceContour
        }
        
  
    }
    
    func detectSmile(_ points:[CGPoint],yal:NSNumber){
        if points.isEmpty == false && yal == 0.0{
            //compare points
            //Calculate distance between p12 and p7
            //MAR = L/D
            
            let distanceHorizontal = CGPointDistanceSquared(from: points[13], to: points[7])
            
            //Calculate - Vertical distances
            
            let distanceVerical1 = CGPointDistanceSquared(from: points[2], to: points[11])
            let distanceVerical2 = CGPointDistanceSquared(from: points[3], to: points[10])
            let distanceVerical3 = CGPointDistanceSquared(from: points[4], to: points[9])
            
            //Calculate average of vertical distances
            
            let sum = distanceVerical1 + distanceVerical2 + distanceVerical3
            let divisor = distanceHorizontal * 3
            
            //Calculate MAR
            let mar = sum/divisor
            
            print("MAR: \(mar)")
            if mar < 0.10 || mar > 0.19{
                delegate?.smileDetected(true)
            }else{
                delegate?.smileDetected(false)
            }
        }
    }
    
    func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }

    func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(CGPointDistanceSquared(from: from, to: to))
    }
}


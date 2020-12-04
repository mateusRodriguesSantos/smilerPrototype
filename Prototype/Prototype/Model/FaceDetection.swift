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

enum facialExpressions{
    case smile
    case sadness
    case fear
}

protocol FaceExpressionDelegate:class {
    func smileDetected(_ smile:Bool)
    func sadnessDetected(_ sadness:Bool)
    func fearDetected(_ fear:Bool)
    func faceDetectedAction(_ boundingBox:CGRect)
}

class FaceDetection{
    
    var expressionDetecting:[facialExpressions] = []
    
    weak var delegate:FaceExpressionDelegate?
    weak var faceView:FaceView?
    weak var previewLayer:AVCaptureVideoPreviewLayer?
    var sequenceHandler = VNSequenceRequestHandler()
    
    init(faceView:FaceView,previewLayer:AVCaptureVideoPreviewLayer,expressionDetecting:[facialExpressions]) {
        self.faceView = faceView
        self.previewLayer = previewLayer
        self.expressionDetecting = expressionDetecting
    }
    
    func detectedFace(request: VNRequest, error: Error?) {
        
        // 1 - Extract the first result from the array of face observation results.
        guard
            let results = request.results as? [VNFaceObservation],
            let result = results.first
        else {
            // 2 - Clear the FaceView if something goes wrong or no face is detected.
     
            faceView?.clear()
            delegate?.faceDetectedAction(.zero)
            return
        }
        
       
        // 3 - Set the bounding box to draw in the FaceView after converting it from the coordinates in the VNFaceObservation.
        //      let box = result.boundingBox
        //        baseView.faceView.boundingBox = convert(rect: box)
        
        let box = convert(rect: result.boundingBox)
        delegate?.faceDetectedAction(box)
        
        
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
        

        if let outerLips = landmark(
          points: landmarks.outerLips?.normalizedPoints,
          to: result.boundingBox) {
            faceView?.outerLips = outerLips
            
            if self.expressionDetecting.contains(.smile) {
                DispatchQueue.main.async { [weak self] in
                    self?.detectSmile(outerLips,yal: result.yaw!,roll: result.roll!)
                }
            }

            if self.expressionDetecting.contains(.fear) {
                DispatchQueue.main.async { [weak self] in
                    self?.detectFear(outerLips, yal: result.yaw!, roll: result.roll!)
                }
            }
            
            if self.expressionDetecting.contains(.sadness){
                
                guard let leftEye = landmark(
                    points: landmarks.leftEye?.normalizedPoints,
                    to: result.boundingBox) else{ return}
                
                faceView?.leftEye = leftEye
                
                guard let rightEye = landmark(
                    points: landmarks.rightEye?.normalizedPoints,
                        to: result.boundingBox) else{ return}
                
                faceView?.rightEye = rightEye
                
                
                guard let leftEyebrow = landmark(
                    points: landmarks.leftEyebrow?.normalizedPoints,
                    to: result.boundingBox) else{ return}
                
                faceView?.leftEyebrow = leftEyebrow
                
               
                guard let rightEyebrow = landmark(
                    points: landmarks.rightEyebrow?.normalizedPoints,
                        to: result.boundingBox) else{ return}
                    
                faceView?.rightEyebrow = rightEyebrow
                
                
                DispatchQueue.main.async { [weak self] in
                    self?.detectSadness(outerLips, pointEyeRight: rightEye[1], pointEyeLeft: leftEye[1], pointEyeBrownRight: leftEyebrow[4], pointEyeBrownLeft: rightEyebrow[4], yal: result.yaw!)
                }
            }
            
        }

//        if let innerLips = landmark(
//          points: landmarks.innerLips?.normalizedPoints,
//          to: result.boundingBox) {
//            faceView?.innerLips = innerLips
//        }
//
//        if let faceContour = landmark(
//          points: landmarks.faceContour?.normalizedPoints,
//          to: result.boundingBox) {
//            faceView?.faceContour = faceContour
//        }
        
  
    }
    
    func detectSmile(_ points:[CGPoint],yal:NSNumber, roll:NSNumber){
        if points.isEmpty == false && yal == 0.0 {

            //compare points
            //Calculate distance between p12 and p7
            //MAR = L/D
            
            let distanceHorizontal = CGPointDistanceSquared(from: points[13], to: points[7])
            
            //Calculate - Vertical distances
            
            let distanceVerical1 = CGPointDistanceSquared(from: points[0], to: points[12])
            let distanceVerical2 = CGPointDistanceSquared(from: points[2], to: points[11])
            let distanceVerical3 = CGPointDistanceSquared(from: points[3], to: points[10])
            let distanceVerical4 = CGPointDistanceSquared(from: points[4], to: points[9])
            let distanceVerical5 = CGPointDistanceSquared(from: points[6], to: points[8])
            let distanceVerical6 = CGPointDistanceSquared(from: points[1], to: points[11])
            let distanceVerical7 = CGPointDistanceSquared(from: points[5], to: points[8])
            
            //Calculate average of vertical distances
            
            let sum = distanceVerical1 + distanceVerical2 + distanceVerical3 + distanceVerical4 + distanceVerical5 + distanceVerical6 + distanceVerical7
            
            let avg = sum / 7
            
            //Calculate MAR
            let mar = avg / distanceHorizontal
            
//            print("MAR: \(mar)")
            
            
            if mar >= 0.16 && mar < 0.20 {
                delegate?.smileDetected(true)
            }else{
                delegate?.smileDetected(false)
            }

//            let marR = Double(round(mar*1000/1000))
//            print(marR)
//
//            if marR == 0.0 {
//                delegate?.smileDetected(true)
//            }
//
            //Neutral
//            if  mar <= 0.12{
//                delegate?.smileDetected(false)
//            }
            
        }
    }
    
    
    func detectFear(_ points:[CGPoint],yal:NSNumber, roll:NSNumber){
        if points.isEmpty == false && yal == 0.0 {

            //compare points
            //Calculate distance between p12 and p7
            //MAR = L/D
            
            let distanceHorizontal = CGPointDistanceSquared(from: points[13], to: points[7])
            
            //Calculate - Vertical distances
            
            let distanceVerical1 = CGPointDistanceSquared(from: points[0], to: points[12])
            let distanceVerical2 = CGPointDistanceSquared(from: points[2], to: points[11])
            let distanceVerical3 = CGPointDistanceSquared(from: points[3], to: points[10])
            let distanceVerical4 = CGPointDistanceSquared(from: points[4], to: points[9])
            let distanceVerical5 = CGPointDistanceSquared(from: points[6], to: points[8])
            let distanceVerical6 = CGPointDistanceSquared(from: points[1], to: points[11])
            let distanceVerical7 = CGPointDistanceSquared(from: points[5], to: points[8])
            
            //Calculate average of vertical distances
            
            let sum = distanceVerical1 + distanceVerical2 + distanceVerical3 + distanceVerical4 + distanceVerical5 + distanceVerical6 + distanceVerical7
            
            let avg = sum / 7
            
            //Calculate MAR
            let mar = avg / distanceHorizontal
            
//            print("MAR: \(mar)")
            
            
            if mar >= 0.20 {
                delegate?.fearDetected(true)
            }else{
                delegate?.fearDetected(false)
            }

        }
    }
    
    func detectSadness(_ pointsMouth:[CGPoint],pointEyeRight:CGPoint,pointEyeLeft:CGPoint,pointEyeBrownRight:CGPoint,pointEyeBrownLeft:CGPoint,yal:NSNumber){
        
        if pointsMouth.isEmpty == false && yal == 0.0 {

            //compare points
            //Calculate distance between p12 and p7
            //MAR = L/D
            
            let distanceHorizontal = CGPointDistanceSquared(from: pointsMouth[13], to: pointsMouth[7])
            
            //Calculate - Vertical distances
            
            let distanceVerical1 = CGPointDistanceSquared(from: pointsMouth[0], to: pointsMouth[12])
            let distanceVerical2 = CGPointDistanceSquared(from: pointsMouth[2], to: pointsMouth[11])
            let distanceVerical3 = CGPointDistanceSquared(from: pointsMouth[3], to: pointsMouth[10])
            let distanceVerical4 = CGPointDistanceSquared(from: pointsMouth[4], to: pointsMouth[9])
            let distanceVerical5 = CGPointDistanceSquared(from: pointsMouth[6], to: pointsMouth[8])
            let distanceVerical6 = CGPointDistanceSquared(from: pointsMouth[1], to: pointsMouth[11])
            let distanceVerical7 = CGPointDistanceSquared(from: pointsMouth[5], to: pointsMouth[8])
            
            //Calculate average of vertical distances
            
            let sum = distanceVerical1 + distanceVerical2 + distanceVerical3 + distanceVerical4 + distanceVerical5 + distanceVerical6 + distanceVerical7
            
            let avg = sum / 7
            
            //Calculate MAR
            let mar = avg / distanceHorizontal
            
            print("MAR: \(mar)")
            
            let distanceEyeRightToEyeBrown = CGPointDistanceSquared(from: pointEyeBrownRight, to: pointEyeRight)
            let distanceEyeLeftToEyeBrown = CGPointDistanceSquared(from: pointEyeBrownLeft, to: pointEyeLeft)
            
            let distanceEyeRightToEyeBrownParse = (distanceEyeRightToEyeBrown) / 1000
            let distanceEyeLeftToEyeBrownParse = (distanceEyeLeftToEyeBrown) / 1000
            
            print(Int(distanceEyeRightToEyeBrownParse))
            print(Int(distanceEyeLeftToEyeBrownParse))
            
            if mar <= 0.0 && (Int(distanceEyeRightToEyeBrownParse) <= 20 || Int(distanceEyeLeftToEyeBrownParse) <= 20){
                delegate?.sadnessDetected(true)
                
            }else{
                delegate?.sadnessDetected(false)
                
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



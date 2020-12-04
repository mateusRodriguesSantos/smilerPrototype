//
//  CameraView.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit
import Vision

class FaceView: UIView {
    
    var neutralOnnerLips = [CGPoint]()
    
    var leftEye: [CGPoint] = []
    var rightEye: [CGPoint] = []
    var leftEyebrow: [CGPoint] = []
    var rightEyebrow: [CGPoint] = []
    var nose: [CGPoint] = []
    var outerLips: [CGPoint] = []
    var innerLips: [CGPoint] = []
    var faceContour: [CGPoint] = []
    var outerLipsPoints: [CAShapeLayer] = []
    var boundingBox = CGRect.zero
    
    func clear() {
        leftEye = []
        rightEye = []
        leftEyebrow = []
        rightEyebrow = []
        nose = []
        outerLips = []
        innerLips = []
        faceContour = []
        outerLipsPoints = []
        boundingBox = .zero
        
        DispatchQueue.main.async {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        // 1
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        // 2
        context.saveGState()

        // 3
        defer {
            context.restoreGState()
        }

        // 4
        context.addRect(boundingBox)

        // 5
        UIColor.yellow.setStroke()

        // 6
        context.strokePath()

        // 1
        UIColor.white.setStroke()
////        
//        if !leftEye.isEmpty {
//            // 2
//            context.addLines(between: leftEye)
//            
//            // 3
//            context.closePath()
//            
//            // 4
//            context.strokePath()
//        }
//        if !rightEye.isEmpty {
//            context.addLines(between: rightEye)
//            context.closePath()
//            context.strokePath()
//        }
//        
//        if !leftEyebrow.isEmpty {
//            context.addLines(between: leftEyebrow)
//            context.strokePath()
//        }
//        
//        if !rightEyebrow.isEmpty {
//            context.addLines(between: rightEyebrow)
//            context.strokePath()
//        }
//        
//        if !nose.isEmpty {
//            context.addLines(between: nose)
//            context.strokePath()
//        }
//        
//        if !outerLips.isEmpty {
//            context.addLines(between: outerLips)
//            context.closePath()
//            context.strokePath()
//        }
//        
//        if !innerLips.isEmpty {
//            context.addLines(between: innerLips)
//            context.closePath()
//            context.strokePath()
//        }
//        
//        if !faceContour.isEmpty {
//            context.addLines(between: faceContour)
//            context.strokePath()
//        }
//
//        for point in outerLips {
//            let point = strongPointLayer(center: point)
//            context.addPath(point.path!)
//            UIColor.red.setFill()
//            context.fillPath()
//        }
//
//        if leftEyebrow.isEmpty == false{
//            let point = strongPointLayer(center: leftEyebrow[4])
//            context.addPath(point.path!)
//            UIColor.red.setFill()
//            context.fillPath()
//        }
//
//        if rightEyebrow.isEmpty == false{
//            let point = strongPointLayer(center: rightEyebrow[4])
//            context.addPath(point.path!)
//            UIColor.red.setFill()
//            context.fillPath()
//        }
//
//        if rightEye.isEmpty == false{
//            let point = strongPointLayer(center: rightEye[1])
//            context.addPath(point.path!)
//            UIColor.red.setFill()
//            context.fillPath()
//        }
//
//        if leftEye.isEmpty == false{
//            let point = strongPointLayer(center: leftEye[1])
//            context.addPath(point.path!)
//            UIColor.red.setFill()
//            context.fillPath()
//        }
        
    }
    
    func registerNeutralOuterLips(){
        if !outerLips.isEmpty{
            neutralOnnerLips = outerLips
        }
    }

    /**
     strongPointLayer
     - Authors: Mateus R.
     - Returns: CAShapeLayer that represents a circle
     - Parameters: Center of the circle
     */
    func strongPointLayer(center:CGPoint) -> CAShapeLayer{
        let strongPoint = UIBezierPath(arcCenter: center, radius: CGFloat(4), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = strongPoint.cgPath
        
        // Change the fill color
        shapeLayer.fillColor = UIColor.red.cgColor
        // You can change the stroke color
//        shapeLayer.strokeColor = UIColor(white: 0.2, alpha: 0.2).cgColor
        // You can change the line width
        shapeLayer.lineWidth = 1.0
        
        return shapeLayer
    }
}

//
//  canvasView.swift
//  lab3
//
//  Created by Brad Hodkinson on 9/26/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import Foundation
import UIKit


class CanvasView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //disable multiple touches for prevention of multiple lines being drawn
        self.isMultipleTouchEnabled = false
        //make the drawing canvas scale to the screen size
        self.contentMode = .scaleAspectFit
        //default the background to white
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //update the canvas
        self.setNeedsDisplay()
        //make the drawing canvas scale to the screen size
        self.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var theLine:Line? {
        didSet {
            //update the canvas
            setNeedsDisplay()
        }
    }
    
    var lines: [Line] = [] {
        didSet {
            //update the canvas
            setNeedsDisplay()
        }
    }
    
    //function to draw a circle
    func drawCircle(_ circle: Line) {
        circle.color.setFill()
        let path = UIBezierPath()
        path.addArc(withCenter: circle.points[0], radius: (circle.width/2), startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        path.fill()
    }
    
    //function to draw a line
    func drawLine(_ line: Line) {
        //set the color of the line
        line.color.setStroke()
        //create a smooth path by putting the points through a smoothing algorithm
        let path = createQuadPath(points: line.points)
        
        //make line look smooth on sharp corners by placing a circle
        for point in line.points {
            var tempLine = line
            tempLine.points = [point]
            drawCircle(tempLine)
        }
        
        //draw line
        path.lineWidth = line.width
        path.append(path)
        path.stroke()
        
    }
    
    // Override draw function to perform custom drawing.
    override func draw(_ rect: CGRect){
        for line in lines {
            //draw a circle at the start of the line
            var startPoint = line
            startPoint.points = [startPoint.points[0]]
            drawCircle(startPoint)
            //check if there is more than one point
            if(line.points.count > 1){
                drawLine(line)
                //draw a circle at the end of the line
                var endPoint = line
                endPoint.points = [endPoint.points[endPoint.points.count-1]]
                drawCircle(endPoint)
            }
            
        }
        //check if the current line can be drawn
        if(theLine != nil){
            //draw a circle at the begining of the current line
            var startPoint = theLine
            startPoint!.points = [startPoint!.points[0]]
            drawCircle(startPoint!)
            
            //draw the current line
            drawLine(theLine!)
            
            //draw a circle at the end of the current line
            var endPoint = theLine
            endPoint!.points = [endPoint!.points[endPoint!.points.count-1]]
            drawCircle(endPoint!)
        }
    }
   
}



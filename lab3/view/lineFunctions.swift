//
//  lineFunctions.swift
//  lab3
//
//  Created by Brad Hodkinson on 9/25/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import Foundation
import UIKit

//function to find the midpoint of two points
private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
    //find the midpoint for x
    let midX = (first.x + second.x)/2
    //find the midpoint for y
    let midY = (first.y + second.y)/2
    //return the coordinates of the midpoint
    let midPoint = CGPoint(x: midX, y: midY)
    return midPoint
}

//function to create a smooth line given an array of points
func createQuadPath(points: [CGPoint]) -> UIBezierPath {
    //create path
    let path = UIBezierPath()
    
    //check if it is just a point
    if points.count < 2 { return path }
    //get the midpoint of the first two points
    let firstPoint = points[0]
    let secondPoint = points[1]
    let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
    //create the first part of the line
    path.move(to: firstPoint)
    path.addQuadCurve(to: secondPoint, controlPoint: firstMidpoint)
    //finish the rest of the line
    for index in 1 ..< points.count-1 {
        let currentPoint = points[index]
        let nextPoint = points[index + 1]
        let midPoint = midpoint(first: currentPoint, second: nextPoint)
        path.move(to: currentPoint)
        path.addQuadCurve(to: nextPoint, controlPoint: midPoint)
    }
    guard let lastLocation = points.last else { return path }
    path.addLine(to: lastLocation)
    return path
}

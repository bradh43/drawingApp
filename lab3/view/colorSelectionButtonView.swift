//
//  colorSelectionButtonView.swift
//  lab3
//
//  Created by Brad Hodkinson on 9/27/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import Foundation
import UIKit

class ColorSelectionButtonView: UIView {
    
    //var radius: CGFloat
    //var color: UIColor
    //var centerX: CGPoint
    
    //var colors: [UIColor] = [.red, .green, .blue, .yellow, .purple]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //todo
       
        createColorButton()
        createSelectionIndicator()
        
    
        
    }
    
//    func drawCircle(color: UIColor, center: CGPoint) {
//        color.setFill()
//        let path = UIBezierPath()
//        path.addArc(withCenter: center, radius: 10, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
//        path.fill()
//        let btn = UIButton(type: .system)
//
//    }
    
    let circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = button.bounds.width / 2
        return button
    }()
    
    func createColorButton(){
        
        for color in colors {
            let tempButton = UIButton()
        }
    }
    
    func drawCircle(){
        
    }
    
    func createSelectionIndicator(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(colors: [UIColor]){
        
    }
    
    
}

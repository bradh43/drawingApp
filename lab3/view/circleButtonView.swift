//
//  colorSelectionButtonView.swift
//  lab3
//
//  Created by Brad Hodkinson on 9/27/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import Foundation
import UIKit

class ColorButtonView: UIView {
    
    //var radius: CGFloat
   // var color: UIColor
   // var showIndicator: Bool
    //var centerX: CGPoint

    //var colors: [UIColor] = [.red, .green, .blue, .yellow, .purple]

    override init(frame: CGRect) {
       // self.color = .red
//self.showIndicator = false
        super.init(frame: frame)
       
    }

//    convenience init(frame: CGRect, color: UIColor, showIndicator: Bool){
//        self.init(frame: frame)
//        self.color = color
//        self.showIndicator = showIndicator
//
//        createColorButton()
//        createSelectionIndicator()
//        setUpLayout()
//
//    }
//
//    let circleButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.layer.cornerRadius = button.bounds.width / 2
//        return button
//    }()
//
//    let indicatorView: UIView = {
//        let frame = CGRect(x: 0, y: 0, width: 8, height: 8)
//        let view = UIView(frame: frame)
//        view.layer.cornerRadius = 4
//        view.layer.masksToBounds = true
//        return view
//    }()
//
//    func createColorButton(){
//         self.addSubview(circleButton)
//
//    }
//
//    func createSelectionIndicator(){
//        let indicatorColor = self.showIndicator ? UIColor.gray : UIColor.white
//        indicatorView.backgroundColor = indicatorColor
//        self.addSubview(indicatorView)
//
//    }
//
//    func setUpLayout(){
//        circleButton.translatesAutoresizingMaskIntoConstraints = false
//        indicatorView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            circleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
//            circleButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            circleButton.heightAnchor.constraint(equalToConstant: 20),
//
//            indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
//            indicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
//            indicatorView.heightAnchor.constraint(equalToConstant: 8),
//            ])
//    }
//
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  

    
}

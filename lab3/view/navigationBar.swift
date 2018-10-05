//
//  navigationBar.swift
//  lab3
//
//  Created by Brad Hodkinson on 9/26/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import Foundation
import UIKit

class NavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        isTranslucent = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

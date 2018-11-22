//
//  Extensions.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/22/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat,
                paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        // EDIT LEFT AND RIGHT 
        
//        if let left = left {
//            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
//        }
//
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
//        if let right = right {
//            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
//        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

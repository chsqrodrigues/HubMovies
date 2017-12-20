//
//  Extensions+UImageView.swift
//  HubMovies
//
//  Created by nds on 20/06/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import UIKit

extension CALayer {
    func maskToCircle() {
        self.frame = self.frame.insetBy(dx: 0, dy: 0)
        self.cornerRadius = self.frame.height/2
        self.masksToBounds = true
        self.borderWidth = 0.5
    }
    
    func maskTo(_ corner: CGFloat) {
        self.cornerRadius = corner
        self.masksToBounds = true
    }
    
    func cardView() {
        self.masksToBounds = false
        self.cornerRadius = 1
        self.shadowOffset = CGSize.init(width: 0.5, height: 0.5)
        self.shadowColor = UIColor.gray.cgColor
        self.shadowRadius = 1.5
        self.shadowOpacity = 0.6
    }
    
    func borderTo(_ value: UIColor?) {
        self.borderWidth = 0.5
        self.borderColor = value?.cgColor
    }
    
    func borderToCustom(value: UIColor, value1: CGFloat) {
        self.borderWidth = value1
        self.borderColor = value.cgColor
    }
}

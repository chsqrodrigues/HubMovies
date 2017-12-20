//
//  Extensions+UIColor.swift
//  BIIS
//
//  Created by Carlos Henrique Siqueira Rodrigues on 25/11/17.
//  Copyright © 2017 Brasil Tecnologia. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    func getGrayDefault() -> UIColor {
        return UIColor(hexString: "232323") ?? .white
    }
}

//
//  UIColor+Extension.swift
//  
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let greenValue = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blueValue = CGFloat(rgb & 0xFF) / 255.0
        
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
    }
}

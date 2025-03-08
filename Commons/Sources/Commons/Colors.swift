//
//  Colors.swift
//
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import UIKit

public enum Colors: CaseIterable {
    case gold
    
    public var color: UIColor {
        switch self {
        case .gold:
            return UIColor(hex: "#ffd700")
        }
    }
}

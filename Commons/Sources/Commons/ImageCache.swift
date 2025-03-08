//
//  ImageCache.swift
//
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import UIKit

public class ImageCache {
    public static let shared = NSCache<NSURL, UIImage>()
}

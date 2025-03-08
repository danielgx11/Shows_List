//
//  AttributedString+Extension.swift
//
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation

public extension AttributedString {
    
    init?(html: String) {
        guard let data = html.data(using: .utf8) else { return nil }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        self.init(attributedString)
    }
}

//
//  localization.swift
//  Project Structure
//
//  Created by Himanshu on 12/03/24.
//

import Foundation

import Foundation

extension String {
    func localized(comment: String? = nil, arguments: [CVarArg]? = nil) -> String {
        let localizedString = NSLocalizedString(self, comment: comment ?? "")
        let targetString = localizedString != self ? localizedString : self
        
        if let args = arguments {
            return String(format: targetString, locale: nil, args)
        }
        
        return targetString
    }
}

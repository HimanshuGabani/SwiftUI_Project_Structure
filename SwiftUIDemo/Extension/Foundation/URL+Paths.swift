//
//  File.swift
//  Project Structure
//
//  Created by Himanshu on 04/03/24.
//

import Foundation

extension URL {
    static func docsPath(for fileName: String) throws -> URL {
        guard let rootPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw URLError(.cannotCreateFile, userInfo: [:])
        }
        
        return rootPath.appendingPathComponent(fileName)
    }
}

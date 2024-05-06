//
//  File.swift
//  
//
//  Created by Himanshu on 30/05/2022.
//

import Foundation

enum APIMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"

    var httpMethod: String {
        rawValue
    }
}

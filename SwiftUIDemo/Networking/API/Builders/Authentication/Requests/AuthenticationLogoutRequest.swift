//
//  AuthenticationLogoutRequest.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 29/03/24.
//

import Foundation

public struct AuthenticationLogoutRequest: APIRequest {
    let userId: Int
    
    public init(userID: Int) {
        self.userId = userID
    }
    
    public var parameters: [String : Any]? {
        [ "user_id": "\(userId)" ]
    }
}

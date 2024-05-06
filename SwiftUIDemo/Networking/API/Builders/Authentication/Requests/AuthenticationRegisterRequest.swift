//
//  AuthenticationRegisterRequest.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 29/03/24.
//

import Foundation
import UIKit

public struct AuthenticationRegisterRequest: APIRequest {
    let userName: String
    let email: String
    let password: String
    var deviceOS: String = ""
    var timeZon: String = ""
    
    
    public init(username: String, password: String, email: String) {
        self.userName = username
        self.password = password
        self.email = email
        self.deviceOS = getDeviceOS()
        self.timeZon = getCurrentTimeZone()
    }
    
    private func getDeviceOS() -> String {
        let osName = UIDevice.current.systemName
        let osVersion = UIDevice.current.systemVersion
        return "\(osName) \(osVersion)"
    }
    
    private func getCurrentTimeZone() -> String {
        let currentTimeZone = TimeZone.current
        let timeZoneIdentifier = currentTimeZone.identifier
        return timeZoneIdentifier
    }
    
    public var parameters: [String : Any]? {
        [
            "name": userName,
            "email": email,
            "password": password,
            "confirm_password": password,
            "device_token": "12345678",
            "device_os": deviceOS,
            "version_type": "openness",
            "group": "2",
            "version": "1",
            "time_zone": timeZon,
            "ip_address": "103.232.125.6"
            
        ]
    }
}

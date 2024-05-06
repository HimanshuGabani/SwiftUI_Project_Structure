import Foundation

public struct AuthenticationLoginRequest: APIRequest {
    let userName: String
    let password: String
    
    public init(email: String, password: String) {
        self.userName = email
        self.password = password
    }
    
    public var parameters: [String : Any]? {
        [
         "name": userName,
         "password": password,
         "device_token": "12345678",
         "device_os":"ios"
        ]
    }
}

import Foundation

enum AuthenticationRequestBuilder: APIBuilderProtocol {
    case register(Request: AuthenticationRegisterRequest)
    case login(request: AuthenticationLoginRequest)
    case logout(Request: AuthenticationLogoutRequest)


    var headers: [String : String]? {
        switch self {
        case .register, .login, .logout :
            return nil
        }
    }

    var method: APIMethod {
        switch self {
        case .register, .login, .logout:
            return .post
        }
    }

    var parameters: [String : Any]? {
        switch self {
        case .register(Request: let request as APIRequest),
             .login(let request as APIRequest),
             .logout(let request as APIRequest):
            
            return request.parameters
        }
    }

    var path: String {
        switch self {
        case .register:
            return "/register"
        case .login:
            return "/login"
        case .logout:
            return "/logout"
        }
    }
}

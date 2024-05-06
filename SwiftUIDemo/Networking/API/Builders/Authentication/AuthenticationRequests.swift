import Combine
import Foundation

public extension APIHelper {
    enum Authentication {
        private typealias Builder = AuthenticationRequestBuilder

        static func register(request: AuthenticationRegisterRequest) -> AnyPublisher<LoginData, APIError> {
            APIService().request(with: Builder.register(Request: request)).eraseToAnyPublisher()
        }
        
        static func login(request: AuthenticationLoginRequest) -> AnyPublisher<LoginData, APIError> {
            APIService().request(with: Builder.login(request: request)).eraseToAnyPublisher()
        }
        
        static func logout(request: AuthenticationLogoutRequest) -> AnyPublisher<Never, APIError> {
            APIService().request(with: Builder.logout(Request: request)).eraseToAnyPublisher()
        }
        
    }
}

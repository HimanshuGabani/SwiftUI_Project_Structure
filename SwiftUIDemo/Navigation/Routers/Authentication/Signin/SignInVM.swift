//
//  SignInVM.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 26/03/24.
//

import Foundation
import Combine

class SignInVM: BaseViewModel {
    
    @Published var usernameTextFiled = FormTExtFiledModel(.username)
    @Published var emailTextFiled = FormTExtFiledModel(.email)
    @Published var passwordTextFiled = FormTExtFiledModel(.password)
    @Published var checkIsempty = false
    private var cancellables: [AnyCancellable] = []
    
    override init() {
        super.init()
        
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    
    
    func isValidate() -> Bool {
        for i in [usernameTextFiled, emailTextFiled, passwordTextFiled] {
            if i.text.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
                sheckView(i)
                return false
            }
        }
        
        if !isValidEmail(emailTextFiled.text) {
            sheckView(emailTextFiled)
            return false
        } else if passwordTextFiled.text.trimmingCharacters(in: .whitespacesAndNewlines).count < 3 {
            sheckView(passwordTextFiled)
            return false
        }
        return true
    }
    
    
    func callSigninApi(callback: @escaping ((Bool)->() )){
        state = .loading
        APIHelper.Authentication.register(request: .init(username: usernameTextFiled.text, password: passwordTextFiled.text, email: emailTextFiled.text))
            .sink { completion in
                self.state = .loaded
                switch completion {
                case .failure(let err):
                    print("Error is:- ", err.localizedDescription, "***")
                    callback(false)
                case .finished:
                    print("Signin Successfull*")
                    callback(true)
                }
            } receiveValue: { data in
                let encodeData = try? JSONEncoder().encode(data)
                UserDefaults.standard.setValues(encodeData, forKey: .userData)
                APIHelper.userToken = data.data.userToken!
                print(data)
            }
            .store(in: &cancellables)
    }
    
    
}

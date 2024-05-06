//
//  LoginVM.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 23/03/24.
//


import SwiftUI
import Combine


class LoginVM: BaseViewModel {
    
    @Published var usernameTextFiled = FormTExtFiledModel(.username)
    @Published var passwordTextFiled = FormTExtFiledModel(.password)
    private var cancellables: [AnyCancellable] = []
    
    override init() {
        super.init()
       
    }
    
    func validation()->Bool {
        for i in [usernameTextFiled, passwordTextFiled] {
            if i.text.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
                sheckView(i)
                return false
            }
        }
        return true
    }
    
    func loginApi(response: @escaping ((Bool)->())){
        state = .loading
        APIHelper.Authentication.login(request: .init(email: usernameTextFiled.text, password: passwordTextFiled.text))
            .sink { [weak self] complision in
                
                switch complision {
                case .failure(let err):
                    sheckView(self!.usernameTextFiled)
                    sheckView(self!.passwordTextFiled)
                    self?.showMessage(text: "invalid login credentials", type: .error)
                    
                    print("Error is:- ", err.localizedDescription, "***")
                    response(false)
                case .finished:
                    print("Provider Called Successfully ***")
                    response(true)
                }
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self?.state = .loaded
                }
            } receiveValue: { data in
                let encodeData = try? JSONEncoder().encode(data)
                UserDefaults.standard.setValues(encodeData, forKey: .userData)
                APIHelper.userToken = data.data.userToken!
                print("Login Data:- ",data.data)
            }
            .store(in: &cancellables)
    }
   
    
}

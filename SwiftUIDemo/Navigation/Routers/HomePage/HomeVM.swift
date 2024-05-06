//
//  HomeVM.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 29/03/24.
//

import Foundation
import Combine

class HomeVM: BaseViewModel {
    
    private var cancellables: [AnyCancellable] = []
    var userEncodedData = UserDefaults.standard.getValue(forKey: .userData)
    var userData: LoginData?
    
    
    override init() {
        super.init()
        userData = try? JSONDecoder().decode(LoginData.self, from: userEncodedData as! Data)
        APIHelper.userToken = userData?.data.userToken ?? ""
    }
    
    func callLogOutAPI(response:  @escaping ((Bool)->()) ) {
        state = .loading
        APIHelper.Authentication.logout(request: .init(userID: userData!.data.id))
            .sink {[weak self] completion in
                self?.state = .loading
                switch completion {
                case .failure(let err):
                    print("Error is:- ", err.localizedDescription, "***")
                    response(false)
                case .finished:
                    print("Signin Successfull*")
                    response(true)
                }
            } receiveValue: { print($0) }
            .store(in: &cancellables)
    }
    
    
    
    
}

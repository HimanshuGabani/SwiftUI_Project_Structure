//
//  FormTExtFiledModel.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 23/03/24.
//

import SwiftUI

enum FormTextFieldDecoratable: String {
    case username
    case email
    case password
    
    var image: String {
        switch self {
        case .username:
            "UserIcon"
        case .email:
            "EmailIcon"
        case .password:
            "LockIcon"
        }
    }
    
    var returnKey: SubmitLabel {
        switch self {
        case .username, .email:
            return .next
        case .password:
            return .done
        }
    }
    
}

class FormTExtFiledModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var shouldShake = false
    @Published var decoratableData: FormTextFieldDecoratable
    @Published var isSecureText = false
    @Published var isSecureFiled = false
    
//    var titel = ""
//    var image: String = ""
//    var placeHolder = ""
    
    
    init(_ type: FormTextFieldDecoratable){
        self.decoratableData = type
        if type == .password {
            isSecureFiled = true
            isSecureText = true
        }
    }
}

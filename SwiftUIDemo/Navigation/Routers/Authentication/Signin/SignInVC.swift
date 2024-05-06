//
//  SignInVC.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 26/03/24.
//

import SwiftUI

struct SignInVC: View {
    
    @ObservedObject private var viewModel = SignInVM()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var appRootManager: AppRootManager
    @FocusState var focus:FormTextFieldDecoratable?
    @State private var isCheckmark = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    GreetingHeader(decorableData: .signin)
                    Image(.HimanshuTextLogo)
                        .padding(.top, 30)
                    form
                        .padding(.top, 30)
                    
                    Button {
                        if viewModel.isValidate() {
                            if isCheckmark {
                                viewModel.callSigninApi { response in
                                    if response {
                                        UserDefaults.standard.setValues(true, forKey: .isUserLogged)
                                        
                                        appRootManager.currentRoot = .homeVC
                                    }
                                }
                            }else{
                                viewModel.checkIsempty = true
                            }
                        }
                    } label: {
                        Text("action.signin".localized())
                            .customFont(.semiBold, size: 14)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 52)
                            .background(Color.font_blue)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    .constrain(Top: 24, Leading: 20, Bottom: 24, Traling: 20)
                    socialButtons
                    
                    Spacer()
                }
                .navigationBarBackButtonHidden()
            }
            .padding(.bottom, 24)
//            .scrollBounceBehavior(.basedOnSize)
            .loadingIndicator(viewModel: viewModel)
            .ignoresSafeArea()
        }
    }
    
    private var form: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(spacing: 16) {
                FormTextFiled(model: viewModel.usernameTextFiled)
                    .keyboardType(.emailAddress)
                    .focused($focus, equals: .username)
                    .onSubmit {
                        focus = .email
                    }
                FormTextFiled(model: viewModel.emailTextFiled)
                    .keyboardType(.emailAddress)
                    .focused($focus, equals: .email)
                    .onSubmit {
                        focus = .password
                    }
                FormTextFiled(model: viewModel.passwordTextFiled)
                    .focused($focus, equals: .password)
            }
            
            HStack(spacing: 0) {
                Button {
                    isCheckmark.toggle()
                    viewModel.checkIsempty = false
                } label: {
                    Image(systemName: isCheckmark ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .scaledToFit()
                        .foregroundColor(.font_gray)
                }
                .padding(.trailing, 12)
                Text("auth.text.condition".localized())
                    .foregroundColor( viewModel.checkIsempty ? .red : .font_gray)
                    .customFont(.medium, size: 12)
            }
            .frame(height: 33)
        }
        .padding(.horizontal, 20)
    }
    
    
    private var socialButtons: some View {
        VStack(spacing: 0) {
            Text ("auth.text.options.socialmedia".localized())
                .foregroundColor(.font_gray)
                .customFont(.medium, size: 14)
            
            HStack (spacing: 16) {
                SocialMediaButton(icon: "GoogleIcon", text: "auth.google.signin".localized())
                SocialMediaButton(icon: "facebookIcon", text: "auth.facebook.signin".localized())
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            
            
            HStack(spacing: 3) {
                Text("auth.text.alreadyaccount".localized())
                    .customFont(.medium, size: 14)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    VStack(spacing: 0) {
                        Text("action.login".localized())
                            .customFont(.semiBold, size: 14)
                            .foregroundColor(.font_blue)
                        Rectangle()
                            .fill(Color.font_blue)
                            .frame(height: 1)
                            
                    }
                    .frame(width: 42, height: 19)
                }
            }
            .padding(.top, 24)
        }
    }
}

#Preview {
    SignInVC()
}

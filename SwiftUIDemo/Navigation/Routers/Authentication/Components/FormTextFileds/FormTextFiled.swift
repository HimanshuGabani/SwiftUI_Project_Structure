//
//  FormTextFileds.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 23/03/24.
//

import SwiftUI

struct FormTextFiled: View {
    
    @ObservedObject var model: FormTExtFiledModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(("form.head."+model.decoratableData.rawValue).localized())
                .customFont(.semiBold, size: 14)
                .padding(.bottom, 16)
            HStack(alignment: .center, spacing: 0) {
                Image(model.decoratableData.image.localized())
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 22)
            
                if model.isSecureText {
                    SecureField(("form.placeholder."+model.decoratableData.rawValue).localized(), text: $model.text)
                        .customFont(.medium, size: 14)
                        .padding(.horizontal, 10)
                        .frame(height: 52)
                        .submitLabel(model.decoratableData.returnKey)
                }else{
                    TextField(("form.placeholder."+model.decoratableData.rawValue).localized(), text: $model.text)
                        .customFont(.medium, size: 14)
                        .padding(.horizontal, 10)
                        .frame(height: 52)
                        .submitLabel(model.decoratableData.returnKey)
                }
                if model.isSecureFiled {
                    Button {
                        model.isSecureText.toggle()
                    } label: {
                        Image(systemName: model.isSecureText ? "eye.slash.fill":"eye.fill")
                            .tint(.font_gray)
                    }
                    .padding(.trailing, 22)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.border_LightGray, lineWidth: 1)
            }
            .offset(x: model.shouldShake ? 35 : 0)
        }
        .frame(maxWidth: .infinity)
        .onAppear{
            model.isSecureText = model.isSecureFiled
        }
    }
}


#Preview {
    
    var model = FormTExtFiledModel(.email)
//    model.titel = "Email Eddress"
//    model.image = "EmailIcon"
//    model.placeHolder = "Enter your email address"
//    model.isSecureFiled = true
    
    return FormTextFiled(model: model)
}

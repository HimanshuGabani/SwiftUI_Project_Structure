//
//  shake+FormTextFiled.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 26/03/24.
//

import SwiftUI


func sheckView(_ textFiled:FormTExtFiledModel, duration dur: Double = 0.2){
    textFiled.shouldShake = true
    withAnimation(Animation.spring(response: dur, dampingFraction: dur, blendDuration: dur).repeatCount(1)) {
        textFiled.shouldShake = false
    }
}

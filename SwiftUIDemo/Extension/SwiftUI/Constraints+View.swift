//
//  Constraints+View.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 23/03/24.
//

import SwiftUI


extension View {
    func constrain(Top t: CGFloat = 0, Leading l:CGFloat = 0, Bottom b:CGFloat = 0, Traling tr: CGFloat = 0)-> some View{
        return self
            .padding(.top, t)
            .padding(.leading, l)
            .padding(.bottom, b)
            .padding(.trailing, tr)
    }
}

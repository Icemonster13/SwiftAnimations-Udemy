//
//  ShaftView.swift
//  Project-14-GearsAndBelts
//
//  Created by Michael Pascucci on 7/25/22.
//

import SwiftUI

// MARK: - SHAFT VIEW STRUCT
struct ShaftView: View {
    
    // MARK: - PROPERTIES
    var width: CGFloat = 0.0
    var motionOffsetX: CGFloat = 0.0
    var motionOffsetY: CGFloat = 0.0
    @State private var animateRect: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("shaft")
                .resizable()
                .frame(width: width, height: 40, alignment: .center)
        }
    }
}

// MARK: - SHAFT MOTION VIEW STRUCT
struct ShaftMotionView: View {
    
    // MARK: - PROPERTIES
    var motionWidth: CGFloat = 0.0
    var motionOffsetX: CGFloat = 0.0
    var motionOffsetY: CGFloat = 0.0
    @State private var animateRect: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: motionWidth, height: 8, alignment: .center)
                .foregroundColor(.black)
                .cornerRadius(5)
                .opacity(animateRect ? 0 : 0.3)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animateRect)
                .onAppear() {
                    animateRect.toggle()
                }
        }
        .offset(x: motionOffsetX, y: motionOffsetY)
    }
}

// MARK: - PREVIEW
struct ShaftView_Previews: PreviewProvider {
    static var previews: some View {
        ShaftView(width: 200)
            .overlay(ShaftMotionView(motionWidth: 100, motionOffsetX: 0, motionOffsetY: -7))
    }
}

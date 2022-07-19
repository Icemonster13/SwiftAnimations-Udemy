//
//  ContentView.swift
//  Project-5-FlyingEagle
//
//  Created by Michael Pascucci on 7/19/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var leftWing = false
    @State private var rightWing = false
    @State private var birdBody = false
    @State private var animateShadow = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // Background
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // Foreground
            ZStack {
                // Left Wing
                Image("leftWing")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .shadow(color: .red, radius: 1, x: 0, y: 3)
                    .rotationEffect(Angle.degrees(leftWing ? -100 : 0), anchor: .bottomTrailing)
                    .offset(x: -55, y: leftWing ? -190 : 0)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: leftWing)
                
                // Right Wing
                Image("rightWing")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .shadow(color: .blue, radius: 1, x: 0, y: 3)
                    .rotationEffect(Angle.degrees(rightWing ? 100 : 0), anchor: .bottomLeading)
                    .offset(x: 55, y: rightWing ? -190 : 0)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: rightWing)
                
                // Body
                Image("body")
                    .resizable()
                    .frame(width: 100, height: 125, alignment: .center)
                    .offset(y: -30)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
                    .offset(y: birdBody ? -50 : 75)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: birdBody)
            }
            .shadow(color: .white, radius: animateShadow ? 1 : 4, x: 0, y: animateShadow ? 10 : 1)
            .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: animateShadow)
            .onAppear() {
                leftWing.toggle()
                rightWing.toggle()
                birdBody.toggle()
                animateShadow.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

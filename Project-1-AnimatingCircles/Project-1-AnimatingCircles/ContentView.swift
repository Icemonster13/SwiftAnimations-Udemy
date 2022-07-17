//
//  ContentView.swift
//  Project-1-AnimatingCircles
//
//  Created by Michael & Diana Pascucci on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .edgesIgnoringSafeArea(.all)
            
            // Foreground
            ZStack {
                
                // CIRCLE SET 1 (STRAIGHT UP AND DOWN)
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                
                // CIRCLE SET 2 (60 DEGREES TO THE RIGHT)
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(60))
                
                // CIRCLE SET 3 (120 DEGREES TO THE RIGHT)
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(120))
                
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1 : 1/4)
            .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8), value: moveInOut)
            .onAppear {
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
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

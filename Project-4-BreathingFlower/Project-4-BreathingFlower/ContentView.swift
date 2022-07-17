//
//  ContentView.swift
//  Project-4-BreathingFlower
//
//  Created by Michael & Diana Pascucci on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var petal = false
    @State private var showShadow = false
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    @State private var breath = false
    @State private var diffuseOnExhale = false
    @State private var degrees: CGFloat = 0.0
    
    let backgroundColor = Color(UIColor.black)
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            // Background
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            //Foreground
            ZStack {
                Text("Breath In")
                    .font(Font.custom("papyrus", size: 35))
                    .foregroundColor(Color(UIColor.green))
                    .opacity(breathInLabel ? 0 : 1)
                    .scaleEffect(breathInLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathInLabel)
                Text("Breath Out")
                    .font(Font.custom("papyrus", size: 35))
                    .foregroundColor(Color(UIColor.orange))
                    .opacity(breathOutLabel ? 0 : 1)
                    .scaleEffect(breathOutLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathOutLabel)
                
                VStack {
                    ZStack {
                        VStack {
                        // Breath
                        Image("breath")
                            .resizable()
                            .frame(width: 35, height: 125, alignment: .center)
                            .offset(y: breath ? 90 : 0)
                            .animation(Animation.timingCurve(0.65, -2.6, 0.32, 0.4).delay(0.05).speed(0.1).repeatForever(autoreverses: true), value: breathInLabel)
                        }
                        .blur(radius: diffuseOnExhale ? 1 : 60)
                        .offset(x: 0, y: diffuseOnExhale ? -25 : -100)
                        
                        // Petals
                        // Far Left Petal
                        Petal(petal: $petal, degrees: petal ? -50 : -10)
                        
                        // Left Petal
                        Petal(petal: $petal, degrees: petal ? -25 : -5)
                        
                        // Middle Petal
                        Image("flower")
                            .resizable()
                            .frame(width: 75, height: 125, alignment: .center)
                        
                        // Right Petal
                        Petal(petal: $petal, degrees: petal ? 25 : 5)
                        
                        // Far Right Petal
                        Petal(petal: $petal, degrees: petal ? 50 : 10)
                        
                        // Flowers
                        Image("bottomFlowers")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 400, alignment: .center)
                            .rotationEffect(Angle.degrees(37))
                            .offset(x: -25, y: 90)
                        
                        Image("bottomFlowers")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 400, alignment: .center)
                            .rotationEffect(Angle.degrees(32))
                            .offset(x: -20, y: 190)
                    }
                    .shadow(radius: showShadow ? 20 : 0)
                    .hueRotation(Angle(degrees: showShadow ? 0 : 100))
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: showShadow)
                }
            }
            .offset(y: -100)
        }
        .onAppear() {
            showShadow.toggle()
            petal.toggle()
            breathInLabel.toggle()
            breathOutLabel.toggle()
            breath.toggle()
            diffuseOnExhale.toggle()
        }
    }
}

struct Petal: View {
    
    // MARK: - PROPERTIES
    @Binding var petal: Bool
    var degrees: Double = 0.0
    
    // MARK: - BODY
    var body: some View {
        Image("flower")
            .resizable()
            .frame(width: 75, height: 125, alignment: .center)
            .rotationEffect(Angle.degrees(petal ? degrees : degrees), anchor: .bottom)
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

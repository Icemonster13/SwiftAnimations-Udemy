//
//  WormGearView.swift
//  Project-14-GearsAndBelts
//
//  Created by Michael Pascucci on 7/25/22.
//

import SwiftUI

struct WormGearView: View {
    
    // MARK: - PROPERTIES
    @State private var rotateWormGear: Bool = false
    @State private var animateRect1: Bool = false
    @State private var animateRect2: Bool = false
    @State private var animateRect3: Bool = false
    @State private var animateRect4: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            ZStack {
                // Worm Gear
                Image("wormGear")
                    .resizable()
                    .frame(width: 100, height: 75, alignment: .center)
                
                // Rectangles for the turning effect
                HStack {
                    Rectangle()
                        .frame(width: 4, height: 40, alignment: .center)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        .opacity(animateRect1 ? 0 : 0.3)
                        .offset(x: 2, y: animateRect1 ? 14 : -8)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animateRect1)
                        .rotationEffect(Angle.degrees(-4), anchor: .top)
                        .onAppear() {
                            animateRect1.toggle()
                        }
                    
                    Rectangle()
                        .frame(width: 4, height: 40, alignment: .center)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        .opacity(animateRect2 ? 0 : 0.3)
                        .offset(x: 7, y: animateRect2 ? -15 : -8)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animateRect2)
                        .rotationEffect(Angle.degrees(-8))
                        .onAppear() {
                            animateRect2.toggle()
                        }
                    
                    Rectangle()
                        .frame(width: 4, height: 40, alignment: .center)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        .opacity(animateRect3 ? 0 : 0.3)
                        .offset(x: 7, y: animateRect3 ? -5 : -10)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animateRect3)
                        .rotationEffect(Angle.degrees(-8), anchor: .top)
                        .onAppear() {
                            animateRect3.toggle()
                        }
                    
                    Rectangle()
                        .frame(width: 4, height: 40, alignment: .center)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        .opacity(animateRect4 ? 0 : 0.3)
                        .offset(x: 5, y: animateRect4 ? -10 : -10)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animateRect4)
                        .rotationEffect(Angle.degrees(-8), anchor: .top)
                        .onAppear() {
                            animateRect4.toggle()
                        }
                }
            }
        }
        .shadow(color: .black, radius: 0.4, x: 0, y: 1)
    }
}

// MARK: - PREVIEW
struct WormGearView_Previews: PreviewProvider {
    static var previews: some View {
        WormGearView()
    }
}

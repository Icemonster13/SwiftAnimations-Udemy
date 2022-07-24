//
//  ContentView.swift
//  Project-11-Swingtime
//
//  Created by Michael & Diana Pascucci on 7/24/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var girlInSwingAnimate = false
    @State private var leftLegAnimate = false
    @State private var rightLegAnimate = false
    let fadeGradient = Gradient(colors: [.clear, .black])
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // Background
            Image("tree")
                .resizable()
                .frame(width: 950, height: 900, alignment: .center)
            
            ZStack {
                // Top Left Rope
                Image("rope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeGradient,
                                         startPoint: .top,
                                         endPoint: .bottom))
                    .frame(width: 6, height: 100, alignment: .center)
                    .offset(x: -3, y: 35)
                
                // Top Right Rope
                Image("rope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeGradient,
                                         startPoint: .top,
                                         endPoint: .bottom))
                    .frame(width: 6, height: 100, alignment: .center)
                    .offset(x: 24, y: 35)
                
                // Middle Right Rope
                Image("rope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 6, height: 100, alignment: .center)
                    .offset(x: 24, y: 80)
                
                // Middle Left Rope
                Image("rope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 6, height: 100, alignment: .center)
                    .offset(x: -3, y: 80)
                
                // Left Leg
                Image("leftLeg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle.degrees(leftLegAnimate ? 65 : -5), anchor: .leading)
                    .scaleEffect(0.15)
                    .offset(x: 70, y: 175)
                    .animation(Animation.easeInOut(duration: 0.4)
                        .delay(1)
                        .repeatForever(autoreverses: true),
                               value: leftLegAnimate)
                    .onAppear() {
                        leftLegAnimate.toggle()
                    }
                
                // Right Leg
                Image("rightLeg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle.degrees(rightLegAnimate ? 0 : 70), anchor: .leading)
                    .scaleEffect(0.15)
                    .offset(x: 70, y: 175)
                    .animation(Animation.easeInOut(duration: 1.0)
                        .delay(0.09)
                        .repeatForever(autoreverses: true),
                               value: rightLegAnimate)
                    .onAppear() {
                        rightLegAnimate.toggle()
                    }
                
                // Girl in Swing
                Image("swingLady")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.15)
                    .offset(y: 140)
            }
            .rotationEffect(Angle.degrees(girlInSwingAnimate ? 12 : -5), anchor: .top)
            .animation(Animation.easeInOut(duration: 1.0)
                .delay(0.09).repeatForever(autoreverses: true), value: girlInSwingAnimate)
            .onAppear() {
                girlInSwingAnimate.toggle()
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

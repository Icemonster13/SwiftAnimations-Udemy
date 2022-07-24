//
//  ContentView.swift
//  Project-12-StarryNight
//
//  Created by Michael & Diana Pascucci on 7/24/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var animateYellow = false
    @State private var animateBlue = false
    @State private var animateRed = false
    @State private var animatePurple = false
    @State private var animateGreen = false
    @State private var starThickness: CGFloat = 0.0
    @State private var starPoints: Int = 0
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            // Background
            Image("stars")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Create a yellow star
                CreateStarView(starPoints: 30,
                               starThickness: $starThickness,
                               animateStar: $animateYellow,
                               fillColor: .yellow,
                               starSizeStart: 0.2,
                               starSizeEnd: 0.4,
                               shadowColor: .yellow)
                    .offset(y: 100)
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 2.3)
                            .repeatForever(autoreverses: true)) {
                                animateYellow.toggle()
                                starThickness = 0.35
                            }
                    }
                
                // Create a blue star
                CreateStarView(starPoints: 6,
                               starThickness: $starThickness,
                               animateStar: $animateBlue,
                               fillColor: .blue,
                               starSizeStart: 0.1,
                               starSizeEnd: 0.3,
                               shadowColor: .blue)
                .offset(x: 70, y: -60)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 3.3)
                        .repeatForever(autoreverses: true)) {
                            animateBlue.toggle()
                            starThickness = 0.35
                        }
                }
                
                // Create a red star
                CreateStarView(starPoints: 5,
                               starThickness: $starThickness,
                               animateStar: $animateRed,
                               fillColor: .red,
                               starSizeStart: 0.2,
                               starSizeEnd: 0.4,
                               shadowColor: .red)
                .offset(x: -70, y: -150)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 1.3)
                        .repeatForever(autoreverses: true)) {
                            animateRed.toggle()
                            starThickness = 0.35
                        }
                }
                
                // Create a purple star
                CreateStarView(starPoints: 8,
                               starThickness: $starThickness,
                               animateStar: $animatePurple,
                               fillColor: .purple,
                               starSizeStart: 0.2,
                               starSizeEnd: 0.4,
                               shadowColor: .purple)
                .offset(x: 80, y: -120)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 2.8)
                        .repeatForever(autoreverses: true)) {
                            animatePurple.toggle()
                            starThickness = 0.35
                        }
                }
                
                // Create a green star
                CreateStarView(starPoints: 7,
                               starThickness: $starThickness,
                               animateStar: $animateGreen,
                               fillColor: .green,
                               starSizeStart: 0.2,
                               starSizeEnd: 0.4,
                               shadowColor: .green)
                .offset(x: -80, y: -170)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 1.8)
                        .repeatForever(autoreverses: true)) {
                            animateGreen.toggle()
                            starThickness = 0.35
                        }
                }
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

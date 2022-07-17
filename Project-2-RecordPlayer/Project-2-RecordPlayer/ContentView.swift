//
//  ContentView.swift
//  Project-2-RecordPlayer
//
//  Created by Michael & Diana Pascucci on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, .black]),
                           center: .center,
                           startRadius: 20,
                           endRadius: 600)
            
            // RECORD PLAYER
            RecordPlayerBoxView()
                .offset(y: -100)
            
            // RECORD
            VStack {
                RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)
                
                // RECORD PLAYER ARM
                RecordPlayerArmView(rotateArm: $rotateArm)
                
                // START and STOP BUTTON
                Button {
                    shouldAnimate.toggle()
                    if shouldAnimate {
                        degrees = 36000
                        rotateArm.toggle()
                        playSound(sound: "music", type: "m4a")
                    } else {
                        rotateArm.toggle()
                        degrees = 0
                        audioPlayer?.stop()
                    }
                } label: {
                    HStack(spacing: 8) {
                        if !shouldAnimate {
                            Text("Play")
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                        } else {
                            Text("Stop")
                            Image(systemName: "stop.fill")
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule()
                        .strokeBorder(Color.black,
                                      lineWidth: 1.25))
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

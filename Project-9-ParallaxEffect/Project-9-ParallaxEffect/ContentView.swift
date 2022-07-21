//
//  ContentView.swift
//  Project-9-ParallaxEffect
//
//  Created by Michael & Diana Pascucci on 7/21/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var animate1 = false
    @State private var animate2 = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .gray]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .colorInvert()
            .edgesIgnoringSafeArea(.all)
            
            // Title
            VStack {
                Text("Parallax Effect")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 80)
                
                // Wolf Image
                VStack {
                    Image("wolf")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .cornerRadius(25)
                        .shadow(color: .black, radius: 30, x: 5, y: 5)
                }
                .rotation3DEffect(
                    .degrees(animate1 ? 13 : -13), axis: (x: animate1 ? 90 : -45, y: animate1 ? -45 : -90, z: 0))
                .animation(Animation.easeInOut(duration: 3.5).repeatForever(autoreverses: true), value: animate1)
                .onAppear() {
                    animate1.toggle()
                }
                .padding(30)
                
                // Cube Image
                VStack {
                    Image("cube")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .cornerRadius(25)
                        .shadow(color: .black, radius: 30, x: 5, y: 5)
                }
                .rotation3DEffect(
                    .degrees(animate2 ? 13 : -13), axis: (x: animate2 ? 90 : -45, y: animate2 ? -45 : -90, z: 0))
                .animation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true), value: animate2)
                .onAppear() {
                    animate2.toggle()
                }
                .padding(30)
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

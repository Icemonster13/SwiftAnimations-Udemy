//
//  ContentView.swift
//  Project-3-HueRotation1
//
//  Created by Michael & Diana Pascucci on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var shiftColors = false
    @State private var image = "dog"
    let backgroundColor = Color.black
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            // Background
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            // Foreground
            VStack {
                Image(image)
                    .resizable()
                    .padding(20)
                    .frame(width: 350, height: 350, alignment: .center)
                    .hueRotation(Angle.degrees(shiftColors ? 360 * 2 : 0))
                    .animation(Animation.easeInOut(duration: 2).delay(0.4).repeatForever(autoreverses: true), value: shiftColors)
                    .onAppear() {
                        shiftColors.toggle()
                    }

                ImagePicker(selectedImage: $image)
            }
        }
    }
}

struct ImagePicker: View {
    
    // MARK: - PROPERTIES
    @Binding var selectedImage: String
    let images: [String] = ["ornament", "landscape", "dog", "dice", "cat"]
    
    // MARK: - BODY
    var body: some View {
        Picker("", selection: $selectedImage) {
            ForEach(images, id: \.self) { value in
                Text(value.capitalized)
                    .foregroundColor(.white)
            }
        }
        .pickerStyle(.wheel)
        .frame(height: 150, alignment: .center)
        .frame(maxWidth: .infinity)
        .background(Color.red.colorMultiply(.blue))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5, x: 1, y: 0)
        .padding(.horizontal, 10)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

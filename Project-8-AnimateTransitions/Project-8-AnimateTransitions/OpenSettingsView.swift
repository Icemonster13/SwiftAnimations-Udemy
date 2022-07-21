//
//  OpenSettingsView.swift
//  Project-8-AnimateTransitions
//
//  Created by Michael & Diana Pascucci on 7/21/22.
//

import SwiftUI

struct OpenSettingsView: View {
    
    // MARK: - PROPERTIES
    @State private var isShowing = false
    let gradientBackground = Gradient(colors: [.black, .white, .black])
    let buttonBorderGradient = LinearGradient(
        gradient: Gradient(colors: [.black, .white, .black]),
        startPoint: .bottomLeading,
        endPoint: .bottomTrailing)
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: gradientBackground, startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                VStack{
                    Text("Wake Up")
                        .foregroundColor(.black)
                        .font(.title)
                    Image(systemName: "clock")
                        .font(.largeTitle)
                }
                .offset(y: -25)
                
                Button {
                    withAnimation(Animation.easeInOut(duration: 1.0)) {
                        self.isShowing = true
                    }
                } label: {
                    Image(systemName: "gear")
                        .font(Font.system(size: 20)
                            .weight(.bold))
                }
                .padding(10)
                .background(Color.orange)
                .cornerRadius(30)
                .foregroundColor(.black)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(buttonBorderGradient, lineWidth: 5)
                        .shadow(color: .gray, radius: 5)
                )
                .offset(y: 200)
                
                if isShowing {
                    SettingsView(show: $isShowing)
                        .transition(.fly)
                        .zIndex(1)
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct OpenSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        OpenSettingsView()
    }
}

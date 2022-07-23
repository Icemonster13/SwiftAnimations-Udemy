//
//  FrameAndDoorsView.swift
//  Project-10-Elevator
//
//  Created by Michael & Diana Pascucci on 7/23/22.
//

import SwiftUI

struct FrameAndDoorsView: View {
    
    // MARK: - PROPERTIES
    @Binding var doorsOpened: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            GeometryReader { geo in
                HStack {
                    // Left Door
                    Image("leftDoor")
                        .resizable()
                        .frame(maxWidth: geo.size.width)
                        .offset(x: doorsOpened ? -geo.size.width / 2 : 4)
                    
                    // Right Door
                    Image("rightDoor")
                        .resizable()
                        .frame(maxWidth: geo.size.width)
                        .offset(x: doorsOpened ? geo.size.width / 2 : -4)
                }
                
                // Door Frame
                Image("doorFrame")
                    .resizable()
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
            }
            .animation(Animation.easeInOut.speed(0.09).delay(0.3), value: doorsOpened)
        }
    }
}

// MARK: - PREVIEW
struct FrameAndDoorsView_Previews: PreviewProvider {
    static var previews: some View {
        FrameAndDoorsView(doorsOpened: .constant(false))
    }
}

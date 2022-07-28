//
//  FanView.swift
//  Project-14-GearsAndBelts
//
//  Created by Michael Pascucci on 7/25/22.
//

import SwiftUI

struct FanView: View {
    
    // MARK: - PROPERTIES
    var degrees: Double = 360 * 6
    @State private var rotateFan = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("fan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .rotationEffect(Angle.degrees(rotateFan ? degrees : 0), anchor: .center)
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotateFan)
        }
        .onAppear() {
            rotateFan.toggle()
        }
        .shadow(color: .black, radius: 1)
    }
}

// MARK: - PREVIEW
struct FanView_Previews: PreviewProvider {
    static var previews: some View {
        FanView()
    }
}

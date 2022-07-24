//
//  CreateStartView.swift
//  Project-12-StarryNight
//
//  Created by Michael & Diana Pascucci on 7/24/22.
//

import SwiftUI

struct CreateStarView: View {
    
    // MARK: - PROPERTIES
    var starPoints: Int
    @Binding var starThickness: CGFloat
    @Binding var animateStar: Bool
    
    var fillColor: Color
    var starSizeStart: CGFloat
    var starSizeEnd: CGFloat
    var shadowColor: Color
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Star(starPoints: starPoints, starThickness: starThickness)
                .fill(fillColor)
                .frame(width: 80, height: 80, alignment: .center)
                .scaleEffect(animateStar ? starSizeStart : starSizeEnd)
                .shadow(color: shadowColor, radius: 20, x: 3, y: 3)
        }
    }
}

//
//  WeeklyGraphView.swift
//  Project-13-WeatherAnimation
//
//  Created by Michael & Diana Pascucci on 7/24/22.
//

import SwiftUI

struct WeeklyGraphView: View {
    
    // MARK: - PROPERTIES
    var dayHeightData: DataModel
    var width: CGFloat
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .opacity(0.3)
                    .frame(width: width + 2, height: 200, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                            .shadow(color: Color.black, radius: 8, x: 0, y: 0))
                Capsule()
                    .frame(width: width, height: dayHeightData.data * 200, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .opacity(0.9))
            }
            .padding(.bottom, 8)
            Text(dayHeightData.day)
                .font(.system(size: 14))
        }
    }
}

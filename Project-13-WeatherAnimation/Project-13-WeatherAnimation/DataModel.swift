//
//  DataModel.swift
//  Project-13-WeatherAnimation
//
//  Created by Michael & Diana Pascucci on 7/24/22.
//

import Foundation
import SwiftUI

struct DataModel {
    let day: String
    let data: CGFloat
    
    static let temperature: [DataModel] = [
        .init(day: "Su", data: 0.9),
        .init(day: "M", data: 0.7),
        .init(day: "T", data: 0.9),
        .init(day: "W", data: 0.8),
        .init(day: "TH", data: 0.75),
        .init(day: "F", data: 0.65),
        .init(day: "Sa", data: 0.85)
    ]
    static let precipitation: [DataModel] = [
        .init(day: "Su", data: 0.4),
        .init(day: "M", data: 0.6),
        .init(day: "T", data: 0.2),
        .init(day: "W", data: 0.3),
        .init(day: "TH", data: 0.4),
        .init(day: "F", data: 0.9),
        .init(day: "Sa", data: 0.5)
    ]
    static let wind: [DataModel] = [
        .init(day: "Su", data: 0.8),
        .init(day: "M", data: 0.4),
        .init(day: "T", data: 0.3),
        .init(day: "W", data: 0.3),
        .init(day: "TH", data: 0.5),
        .init(day: "F", data: 0.3),
        .init(day: "Sa", data: 0.2)
    ]
}

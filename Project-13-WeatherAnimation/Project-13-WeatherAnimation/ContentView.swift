//
//  ContentView.swift
//  Project-13-WeatherAnimation
//
//  Created by Michael & Diana Pascucci on 7/24/22.
//

import SwiftUI
import SunMoonToggleStyle

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var dataArray = [DataModel.temperature, DataModel.precipitation, DataModel.wind]
    
    var capsuleWidth: CGFloat = 14
    @State private var pickerSelection = 0
    @State private var isOn = false
    @State private var animateTemp = false
    @State private var animatePrecip = false
    @State private var animateWind = false
    @State private var animateTempImage = false
    @State private var animatePrecipImage = false
    @State private var animateWindImage = false
    
    init() {
        // The foreground color of each selected segment
        UISegmentedControl.appearance().selectedSegmentTintColor = .black
        // The color of the title for the selected segment
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        // The color of the title for the unselected segments
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            // Background
            Color(.sRGB, red: 255/255, green: 195/255, blue: 0/255, opacity: 1)
                .edgesIgnoringSafeArea(.all)
            
            // Foreground
            VStack {
                // Title
                Text("Weather")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                    .font(.title)
                    .shadow(color: .black, radius: 1, x: 0, y: 0)
                
                // Toggle Switch
                SunMoonToggleView(isOn: $isOn)
                
                // Segmented Picker
                PickerView(pickerSelection: $pickerSelection)
                    .onReceive([pickerSelection].publisher.first()) { value in
                        // Temperature selected
                        if value == 0 {
                            animateTemp = true
                            animateTempImage = true
                            animatePrecip = false
                            animatePrecipImage = false
                            animateWind = false
                            animateWindImage = false
                        
                        // Precipitation selected
                        } else if value == 1 {
                            animateTemp = false
                            animateTempImage = false
                            animatePrecip = true
                            animatePrecipImage = true
                            animateWind = false
                            animateWindImage = false
                        
                            // Wind selected
                        } else {
                            animateTemp = false
                            animateTempImage = false
                            animatePrecip = false
                            animatePrecipImage = false
                            animateWind = true
                            animateWindImage = true
                        }
                    }
                
                // Weekly Graph
                ZStack {
                    HStack(spacing: 20) {
                        WeeklyGraphView(dayHeightData: dataArray[pickerSelection][0], width: (350) / capsuleWidth)
                        WeeklyGraphView(dayHeightData: dataArray[pickerSelection][1], width: (350) / capsuleWidth)
                        WeeklyGraphView(dayHeightData: dataArray[pickerSelection][2], width: (350) / capsuleWidth)
                        WeeklyGraphView(dayHeightData: dataArray[pickerSelection][3], width: (350) / capsuleWidth)
                        WeeklyGraphView(dayHeightData: dataArray[pickerSelection][4], width: (350) / capsuleWidth)
                        WeeklyGraphView(dayHeightData: dataArray[pickerSelection][5], width: (350) / capsuleWidth)
                        WeeklyGraphView(dayHeightData: dataArray[pickerSelection][6], width: (350) / capsuleWidth)
                    }
                    .animation(Animation.spring(response: 0.9, dampingFraction: 0.6), value: pickerSelection)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1)
                        .shadow(color: Color.black, radius: 8, x: 3, y: 3)
                        .padding(.horizontal, 10)
                }
                GeometryReader { geo in
                    VStack {
                        if animateTemp {
                            Text("Temperature")
                                .fontWeight(.medium)
                                .font(.title)
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                                .transition(AnyTransition.offset(x: 300))
                                .animation(Animation.easeOut(duration: 1.0))
                        }
                        if animatePrecip {
                            Text("Precipitation")
                                .fontWeight(.medium)
                                .font(.title)
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                                .transition(AnyTransition.offset(x: -300))
                                .animation(Animation.easeOut(duration: 1.0), value: animatePrecip)
                        }
                        if animateWind {
                            Text("Wind")
                                .fontWeight(.medium)
                                .font(.title)
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                                .transition(AnyTransition.offset(x: 300))
                                .animation(Animation.easeOut(duration: 1.0))
                        }
                    }
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                    
                    VStack {
                        if animateTempImage {
                            Image("tempImage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width / 2, height: geo.size.height / 2, alignment: .center)
                                .position(y: geo.size.height / 2)
                                .transition(AnyTransition.offset(y: 300))
                                .animation(Animation.easeOut(duration: 1.0))
                        }
                        if animatePrecipImage {
                            Image("precip")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width / 2, height: geo.size.height / 2, alignment: .center)
                                .position(y: geo.size.height / 2)
                                .transition(AnyTransition.offset(x: 300))
                                .animation(Animation.easeOut(duration: 1.0))
                        }
                        if animateWindImage {
                            Image("wind")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width / 2, height: geo.size.height / 2, alignment: .center)
                                .position(y: geo.size.height / 2)
                                .transition(AnyTransition.offset(x: -300))
                                .animation(Animation.easeOut(duration: 1.0))
                        }
                    }
                    .position(x: geo.size.width, y: geo.size.height * 0.6)
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

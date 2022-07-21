//
//  SettingsView.swift
//  Project-8-AnimateTransitions
//
//  Created by Michael Pascucci on 7/21/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    @State private var selection: Int = 1
    @State private var setDate = Date()
    @State private var timeZoneOverride = true
    @State private var volume: Double = 25.0
    @Binding var show: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    // Date Picker
                    Section {
                        DatePicker(selection: $setDate) {
                            Image(systemName: "calendar.circle")
                        }
                        .foregroundColor(.black)
                    } header: {
                        Text("Date and Time")
                    }
                    .listRowBackground(Color(UIColor.orange))
                    
                    // Time Zone Toggle
                    Section {
                        Toggle(isOn: $timeZoneOverride) {
                            HStack {
                                Image(systemName: "timer")
                                Text("Override")
                            }
                            .foregroundColor(.black)
                        }
                    } header: {
                        Text("Time Zone Override")
                    }
                    .listRowBackground(Color(UIColor.orange))
                    
                    // Alarm Volume
                    Section {
                        Text("Volume \(String(format: "%.0f", volume as Double)) Decibels")
                            .foregroundColor(.black)
                        Slider(value: $volume, in: 0...100) { _ in
                            // Code to run when the sider is moved
                        }
                    } header: {
                        Text("Alarm Volume")
                    }
                    .listRowBackground(Color(UIColor.orange))
                    
                    // Repeat Alarm
                    Section {
                        Picker(selection: $selection) {
                            Text("No Repeat").tag(1)
                            Text("Repeat Once").tag(2)
                            Text("Repeat Twice").tag(3)
                        } label: {
                            Text("Repeat Alarm")
                        }
                        .foregroundColor(.black)
                    } header: {
                        Text("Repeat Alarm")
                    }
                    .listRowBackground(Color(UIColor.orange))
                    
                    // Save Button
                    Button {
                        withAnimation(Animation.easeInOut(duration: 1.0)) {
                            self.show = false
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.green)
                }
                .foregroundColor(.white)
                .listStyle(InsetGroupedListStyle())
            }
            .frame(width: 350, height: 625, alignment: .center)
            .cornerRadius(20)
            
            Text("Settings")
                .offset(y: -250)
                .foregroundColor(.black)
                .font(.title)
        }
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(show: .constant(false))
    }
}

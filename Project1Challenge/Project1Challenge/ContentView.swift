//
//  ContentView.swift
//  Project1Challenge
//
//  Created by Allen Lee on 2024/4/11.
//

import SwiftUI

struct ContentView: View {
    enum TempUnits: String, CaseIterable{
        case celsius
        case fahrenheit
        case kelvin
    }
    
    @State private var inputTempurature: Double?
    @State private var selectedTempUnit = TempUnits.celsius
    private var outputTempurature: Double? {
        guard let inputTempurature else { return nil }
        switch selectedTempUnit {
        case .celsius:
            return inputTempurature
        case .fahrenheit:
            return inputTempurature * 9 / 5 + 32
        case .kelvin:
            return inputTempurature + 273.15
        }
    }
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Temperature") {
                    TextField("Input celsius", value: $inputTempurature, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Temp. unit", selection: $selectedTempUnit) {
                        ForEach(TempUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(outputTempurature ?? .nan, format: .number)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

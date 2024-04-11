//
//  ContentView.swift
//  Project1Challenge
//
//  Created by Allen Lee on 2024/4/11.
//

import SwiftUI

struct ContentView: View {
    // MARK - Tempurature
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
    
    // MARK - Length
    enum LengthUnits: String, CaseIterable{
        case meters
        case kilometers
        case feet
        case yards
        case miles
    }
    
    @State private var inputLengthValue: Double?
    @State private var inputLengthUnit: LengthUnits = .meters
    @State private var outputLengthUnit: LengthUnits = .meters
    
    private var outputLengthValue: Double? {
        guard let inputLengthValue else { return nil }
        // parse to meter first, then turn into target unit
        var rawLength: Double
        switch inputLengthUnit {
        case .meters:
            rawLength = inputLengthValue
        case .kilometers:
            rawLength = inputLengthValue * 1000
        case .feet:
            rawLength = inputLengthValue * 0.3048
        case .yards:
            rawLength = inputLengthValue * 0.9144
        case .miles:
            rawLength = inputLengthValue * 1609.344
        }
        
        switch outputLengthUnit {
        case .meters:
            return rawLength
        case .kilometers:
            return rawLength / 1000
        case .feet:
            return rawLength / 0.3048
        case .yards:
            return rawLength / 0.9144
        case .miles:
            return rawLength / 1609.344
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
                
                Section("Length") {
                    TextField("Input length", value: $inputLengthValue, format: .number)
                    
                    Picker("Input length unit", selection: $inputLengthUnit) {
                        ForEach(LengthUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Output length unit", selection: $outputLengthUnit) {
                        ForEach(LengthUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Text(outputLengthValue ?? .nan, format: .number)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

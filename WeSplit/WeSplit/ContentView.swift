//
//  ContentView.swift
//  WeSplit
//
//  Created by Allen Lee on 2024/4/8.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    private let nameList = ["Harry", "Allen", "Ron"]
    @State private var selectedName = "Allen"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Tips") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Section("Present Tips") {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Section one") {
                    Button("Tap Count: \(tapCount)") {
                        tapCount += 1
                    }
                    
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }

                Section("Section two") {
                    ForEach(0..<10) { num in
                        Text("This is row \(num+1)")
                    }
                }
                
                Section("Section picker") {
                    Picker("Select user", selection: $selectedName) {
                        ForEach(nameList, id: \.self) {
                            Text("User \($0)")
                        }
                    }
                }
                
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

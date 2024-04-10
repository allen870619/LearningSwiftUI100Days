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
    var totalPerPerson: Double {
        let tips = checkAmount / 100 * Double(tipPercentage)
        let grandTotal = checkAmount + tips
        return grandTotal / Double(numberOfPeople + 2)
    }
    
    @FocusState private var amountIsFocused: Bool
    
    @State private var newPerPersonAmount = 0
    @State private var newTipPercentage = 0
    @State private var numsOfPerson = 1
    private var newTotalAmount: Double {
        let perPerson = Double(newPerPersonAmount) * (1 + Double(newTipPercentage) / 100)
        return perPerson * Double((numsOfPerson + 1))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // Challenge
                Section("Amount per person") {
                    TextField("Total amount", value: $newPerPersonAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    Picker("Tip percentage", selection: $newTipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Picker("Number of person", selection: $numsOfPerson) {
                        ForEach(1..<11) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("Total amount") {
                    Text(newTotalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                // course content
                Section("Input") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<200) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink) // must use with navigationStack
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar(content: {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            })
        }
    }
}

#Preview {
    ContentView()
}

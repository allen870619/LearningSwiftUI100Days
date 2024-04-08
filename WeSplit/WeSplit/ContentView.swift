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
    
    var body: some View {
        NavigationStack {
            Form {
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

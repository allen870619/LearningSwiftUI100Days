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
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
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

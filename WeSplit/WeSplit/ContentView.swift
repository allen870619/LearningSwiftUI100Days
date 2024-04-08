//
//  ContentView.swift
//  WeSplit
//
//  Created by Allen Lee on 2024/4/8.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Section one") {
                    Button("Tap Count: \(tapCount)") {
                        tapCount += 1
                    }
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

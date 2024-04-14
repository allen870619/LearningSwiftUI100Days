//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Allen Lee on 2024/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello, world!")
            Color.green
                .frame(width: 200, height: 200)
            Text("This is another text view")
                .background(.blue)
            ZStack {
                VStack(spacing: 0) {
                    Color.red
                    Color.blue
                }

                Text("Your content")
                    .foregroundStyle(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
        }
        .background(.red)
        .padding()
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

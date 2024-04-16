//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Allen Lee on 2024/4/14.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Tap the flag of")
                    .foregroundStyle(.white)
                Text(countries[correctAnswer])
                    .foregroundStyle(.red)
                
                ForEach(0..<3) { num in
                    Button {
                        // action
                    } label: {
                        Image(countries[num])
                    }
                }
            }
        }
        
        
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Hello, world!")
//            Color.green
//                .frame(width: 200, height: 200)
//            Text("This is another text view")
//                .background(.blue)
//            ZStack {
//                VStack(spacing: 0) {
//                    Color.red
//                    Color.blue
//                }
//
//                Text("Your content")
//                    .foregroundStyle(.secondary)
//                    .padding(50)
//                    .background(.ultraThinMaterial)
//            }
//        }
//        .background(.red)
//        .padding()
//        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

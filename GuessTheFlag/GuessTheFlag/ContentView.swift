//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Allen Lee on 2024/4/14.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
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
                        flagTapped(num)
                    } label: {
                        Image(countries[num])
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                generateQuestion()
            }
        } message: {
            Text("Your score is ???")
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
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        showingScore = true
    }
    
    func generateQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
    }
}

#Preview {
    ContentView()
}

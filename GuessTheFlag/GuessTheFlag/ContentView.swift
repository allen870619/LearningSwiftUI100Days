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
    
    @State private var isAlertPresented = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var score = 0
    @State private var questionCount = 0
    @State private var isWrongAnswer = false
    private let totalQuestion = 8
    
    var body: some View {
        ZStack {
            //            LinearGradient(gradient: .init(colors: [.cyan, .black]), startPoint: .top, endPoint: .bottom)
            //                .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 16) {
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy ))
                    Text(countries[correctAnswer])
                        .foregroundStyle(.red)
                        .font(.largeTitle.weight(.bold))
                    
                    ForEach(0..<3) { num in
                        Button {
                            flagTapped(num)
                        } label: {
                            Image(countries[num])
                                .clipShape(.capsule)
                                .shadow(color: .red, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                        }
                        .padding(4)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .fontWeight(.medium)
                
                Spacer()
                Spacer()
                
                Text("Score is \(score)")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
        }
        .alert(alertTitle, isPresented: $isAlertPresented) {
            Button("Continue") {
                if isWrongAnswer {
                    isWrongAnswer = false
                    generateQuestion()
                } else {
                    resetGame()
                }
            }
        } message: {
            Text(alertMessage)
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
        questionCount += 1
        if correctAnswer == number {
            score += 1
        } else {
            isWrongAnswer = true
        }
        
        if questionCount == totalQuestion  {
            alertTitle = "Your score is \(score)"
            alertMessage = "Press to restart a new game"
            isAlertPresented = true
        } else if isWrongAnswer {
            alertTitle = "Wrong"
            alertMessage = "Wrong! That’s the flag of \(countries[number])"
            isAlertPresented = true
        } else  {
            generateQuestion()
        }
    }
    
    func generateQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
    }
    
    func resetGame() {
        questionCount = 0
        score = 0
        generateQuestion()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dharshan Tharumia on 3/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var count = 0
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var endGame = false
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.16, blue: 0.26), location: 0.3)], center:.top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    ForEach(0..<3) {
                        number in
                        Button {
                            flagTapped(number)
                            
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        
            
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
        .alert(scoreTitle, isPresented: $endGame) {
            Button("Yes", action: askQuestion)
            Button("No", action: reset)
        } message: {
            Text("Do you wish to play again")
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        count += 1
        showingScore = true
    }
    
    func askQuestion() {
        if count == 8 {
            scoreTitle = "Game Over! Your final score was \(score)"
            endGame = true
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func reset() {
        showingScore = false
        scoreTitle = ""
        score = 0
        countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        count = 0
        
        correctAnswer = Int.random(in: 0...2)
        endGame = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Flags - everywhere
//
//  Created by Parth Antala on 2024-07-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    @State private var currentScore: Int = 0
    @State private var isAnswerCorrect: Bool?
    
    @State private var isAnswered: Bool = false
    
    @State private var holder: String = ""
    var gradient = MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ], colors: [
        .cyan, .blue, .blue,
        .white, .white, .purple,
        .cyan, .green, .green
    ])
    
    var body: some View {
        ZStack {
                
            
                MeshGradient(width: 3, height: 3, points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [0.5, 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ], colors: [
                    isAnswerCorrect ?? true ? .green : .red, isAnswerCorrect ?? true ? .green : .red, .white,
                    .white, .white, .white,
                    .white, isAnswerCorrect ?? true ? .green : .red, isAnswerCorrect ?? true ? .green : .red
                ])
                .ignoresSafeArea()
            
            VStack {
                Text("Tap the flag of")
                    .font(.subheadline.weight(.heavy))
                    .foregroundStyle(.white)
                Text(countries[correctAnswer])
                    .font(.largeTitle.weight(.semibold))
                    .foregroundStyle(.white)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isAnswerCorrect ?? true ? .green : .red)
                        .opacity(0.3)
                        .shadow(radius: 10)
                        .frame(height: 500)
                        .padding()
                        
                    VStack {
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                                isAnswered = true
                            } label: {
                                FlagImage(index: number, countries: countries)
                                 
                                  
                            }
                            
                        }
                        .animation(.easeInOut(duration: 1))
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .opacity(0.3)
                                .shadow(radius: 10)
                                .frame(maxWidth: 230, maxHeight: 120)
                                .padding()
                            VStack {
                                Text("Score: \(currentScore)")
                                    .padding(.top)
                                    .font(.system(size: 32, weight: .heavy))
                                    .foregroundColor(isAnswerCorrect ?? true ? .green : .red)
                                    .animation(.easeInOut)
                                Text(holder)
                                    .font(.system(size: 55, weight: .heavy))
                                    .foregroundColor(isAnswerCorrect ?? true ? .green : .red)
                                    .animation(.easeInOut)
                            }
                        }
                        
                        
                        
                    }.padding(.top)
                    
                }
                
                VStack {
                    Button("Next", systemImage: "arrow.forward") {
                        askQuestion()
                        holder = ""
                    }
                    .frame(height: isAnswered ? nil : 0)
                    .buttonStyle(.borderedProminent)
                    .tint(.white.opacity(0.4))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    
                    
                    
                    Button("Start Over", systemImage: "gobackward") {
                        askQuestion()
                        currentScore = 0
                        holder = ""
                        isAnswerCorrect = true
                    }
                    .buttonStyle()
                    
                }
                .animation(.bouncy)
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
            isAnswerCorrect = true
            holder = "Correct"
        } else {
            scoreTitle = "Wrong"
            currentScore -= 1
            isAnswerCorrect = false
            holder = "Wrong"
        }
        
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct FlagImage: View {
    var index: Int
    var countries: [String]
    
    var body: some View {
        Image(countries[index])
            .cornerRadius(23)
            .shadow(radius: 5)
    }
}

struct ButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .buttonStyle(.borderedProminent)
        .tint(.white.opacity(0.4))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonViewModifier())
    }
}

#Preview {
    ContentView()
}

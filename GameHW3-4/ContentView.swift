//
//  ContentView.swift
//  GameHW3-4
//
//  Created by Ivanov Sergey on 22.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var score = 0
    @State private var alert = false
    
    var body: some View {
        VStack {
            Text("Передвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                GameUISlider(value: $currentValue, targetValue: $targetValue)
                Text("100")
            }
            .padding()
            Button("Проверь меня!") {
                computeScore()
                alert = true
            }
            .padding()
            .alert(isPresented: $alert) {
                Alert(title: Text("Your Score"), message: Text("\(score)"))
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            
        
        }
    }
}

extension ContentView {
    
    private func computeScore() {
        let difference = abs(targetValue - lround(currentValue))
        score = 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
